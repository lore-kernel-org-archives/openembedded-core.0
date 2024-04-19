Return-Path: <daniel.klauer@gin.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 836F6C4345F
	for <webhook@archiver.kernel.org>; Fri, 19 Apr 2024 12:40:42 +0000 (UTC)
Received: from good-out-01.clustermail.de (good-out-01.clustermail.de [212.223.35.17])
 by mx.groups.io with SMTP id smtpd.web10.19866.1713530435253214445
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Apr 2024 05:40:35 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: gin.de, ip: 212.223.35.17, mailfrom: daniel.klauer@gin.de)
Received: from [10.0.0.13] (helo=frontend.clustermail.de)
	by smtpout-01.clustermail.de with esmtp (Exim 4.96.1)
	(envelope-from <Daniel.Klauer@gin.de>)
	id 1rxnXc-0001Oc-1o;
	Fri, 19 Apr 2024 14:40:33 +0200
Received: from [62.157.191.2] (helo=Win2012-02.gin-domain.local)
	by frontend.clustermail.de with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384
	(Exim 4.97.1)
	(envelope-from <Daniel.Klauer@gin.de>)
	id 1rxnXc-000000002g8-3oU3;
	Fri, 19 Apr 2024 14:40:32 +0200
Received: from [10.176.8.60] (10.176.8.60) by Win2012-02.gin-domain.local
 (10.160.128.12) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 19 Apr
 2024 14:40:32 +0200
Message-ID: <b64c56a0-30ba-44a1-a169-56c5f7540806@gin.de>
Date: Fri, 19 Apr 2024 14:40:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH] cmake.bbclass: Add ${COREBASE}/scripts to
 CMAKE_FIND_ROOT_PATH
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <20240417112444.395440-1-daniel.klauer@gin.de>
 <CAMKF1sq24dcWjAKkT5C4=bSER7wfvcrbaQb1YfFacVk=f2iv_Q@mail.gmail.com>
Content-Language: en-US
From: Daniel Klauer <daniel.klauer@gin.de>
In-Reply-To: <CAMKF1sq24dcWjAKkT5C4=bSER7wfvcrbaQb1YfFacVk=f2iv_Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.176.8.60]
X-ClientProxiedBy: Win2012-02.gin-domain.local (10.160.128.12) To
 Win2012-02.gin-domain.local (10.160.128.12)
X-EsetResult: clean, is OK
X-EsetId: 37303A29342AA850677762
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Apr 2024 12:40:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198548

Hi,

>> ${COREBASE}/scripts contains a "git" wrapper disabling fakeroot/pseudo.
>> This patch allows CMake to find ${COREBASE}/scripts/git instead of
>> ${HOSTTOOLS_DIR}/git. This is needed for git invocations during do_install,
>> since do_install is a fakeroot task, and otherwise all git commands fail
>> with "fatal: detected dubious ownership in repository ...".
>>
>> I don't know how common it is for CMake projects to invoke git during the
>> install phase intentionally. It's probably more common to do this during
>> the configure phase. However, the install step may re-run the configure
>> step, if some dependencies changed.
>
>
> If a package build system has such dependencies they should be better expressed in recipes and linked using bitbake task level dependency mechanism 
> 
> I wonder why git is needed during install phase
> Can you explain a bit more on that 
> 
> And since change it in a class it means it has to be a pattern 

It's just about running "git rev-parse HEAD" or similar, not acquiring external dependencies with "git clone", FetchContent download, etc., if that's what you meant. "dependencies" referred to timestamps of files checked by make/ninja.

The affected CMake projects are using code like the following to query Git revision information (for storing into header files and binaries):

	find_package(Git REQUIRED)
	execute_process(COMMAND "${GIT_EXECUTABLE}" rev-parse HEAD ...)
	set_property(DIRECTORY APPEND PROPERTY CMAKE_CONFIGURE_DEPENDS "${CMAKE_CURRENT_SOURCE_DIR}/.git/HEAD")

${S} is owned by the user that runs bitbake, so cmake succeeds running such git commands during do_configure, but they fail during do_install because it's under fakeroot/pseudo.

This can be fixed by allowing CMake to use the git wrapper script which temporarily disables fakeroot. It's already in PATH anyways (see PATH:prepend = "${COREBASE}/scripts..." in bitbake.conf), but CMake's find_package(Git) only respects CMAKE_FIND_ROOT_PATH. The description of commit af27c81e "scripts: Make git intercept global" hints at this type of situation.


As for why cmake re-runs during do_install, I'm still trying to piece it together and reduce it to a minimal example. I can try to explain what I know so far:

Basically, it's normal for a CMake project to be re-configured by "make" or "make install" (or ninja equivalents), if for example the CMakeLists.txt or files referenced by CMAKE_CONFIGURE_DEPENDS were modified, and an existing build directory was re-used. I'm not really surprised to see this case occurring in Yocto aswell. Presumably it can only happen in incremental Yocto builds if do_fetch/do_unpack/do_patch were already run previously and don't need to run again.

What I did:

1. have a recipe for a library
2. have a recipe for a program which depends on that library (and of courses uses DEPENDS += "library")
3. run bitbake to build the image
4. modify library:do_install (to install a different configuration file into /etc)
5. modify program:do_install (same)
6. run bitbake to build the image

My observations for the 2nd bitbake run (after I modified the two do_install functions):

6.1. library:do_configure did not run again (makes sense, since I didn't change anything there)
6.2. library:do_compile   did not run again (same)
6.3. library:do_install was re-run (due to the changes for the new config file in /etc)
6.4. library:do_package was re-run (but presumably only the main library package changed, not the library-dev or library-static packages)
6.5. program:do_configure did not run again (not sure why not, since library recipe changed, but maybe bitbake noticed through the library packaging that only /etc changed and not the library or its header files)
6.6. program:do_compile   did not run again (same)
6.7. program:do_install was re-run
6.7.1. The library was re-populated into the program's recipe-sysroot ("NOTE: <library> exists in sysroot, but is stale")
6.7.2. "ninja install" re-ran CMake to re-configure the project (I'm guessing due to the re-population of the recipe-sysroot), this is where the git commands failed.


Regards,
Daniel

