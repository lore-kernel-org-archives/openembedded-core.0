Return-Path: <andre.draszik@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7DA0C6074F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 12:21:27 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id t11-v6so31714988wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 May 2018 05:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=SXoM5T1QWNvPuAcXc/BXOvvOTJOlNNc6B5LwQYyVcxk=;
	b=EWMD+18fvEnf0LaoW9P6eE13Tx5yK8myNy4e6/eu3ZlD4dzbijMPjFUEcINTZ52gKx
	AO0cP2cV/YwGr3wdsgrPIEr8pmsvB6HukbEInF5HDPnq78l4J6mzvjvhHuSR6GzsuZtb
	qzkvIGlYRXyA5yjmzUv8Xb44nXvPIKzYKYoNWga92NmxedsdoZiBrw0S5ej1LDRpYkE7
	VwfkOtMbzmHUV3SQA1bexo0qR/MAaLiHgRV1EzrnWi5RG2MKt8C+mIqgKVWW9u/n4erC
	sEc0AVCaufviU0y+HtRX8gy36WNJTqRVN74HRMm71fWIth6o0PBumK4Acl7ZTLo22qZ+
	D5IA==
X-Gm-Message-State: ALKqPwf8l/tZE/2KnDdD12m82bJbk9eIEaDZG17UWF7gXN0KsgTSzx9o
	6dCCDu3Z0eYiOLLA29pB54wLoXPF
X-Google-Smtp-Source: AB8JxZqQhCEmfQnBbiOe9RdQ5rWRbRGTbkOlwp9S5TsQQOEBh0fCnZMi8XQmXR8LnPdxO5FW1avN0A==
X-Received: by 2002:aa7:d5d1:: with SMTP id
	d17-v6mr14404517eds.312.1527510087436; 
	Mon, 28 May 2018 05:21:27 -0700 (PDT)
Received: from tfsielt31850 ([77.107.218.170])
	by smtp.gmail.com with ESMTPSA id
	v37-v6sm981813edm.0.2018.05.28.05.21.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 28 May 2018 05:21:26 -0700 (PDT)
Message-ID: <95c10f0a911c861e5bd87275f1d55a1b8e73c7af.camel@andred.net>
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <git@andred.net>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 May 2018 13:21:25 +0100
In-Reply-To: <0980e127-6744-378f-479a-e841f0a0d20e@vaisala.com>
References: <20180525123739.73219-1-niko.mauno@vaisala.com>
	<CABcZANnPjLCrjSksPCDkN0it1jwBS6_MtJjOkCT=NG=Wf-zR6A@mail.gmail.com>
	<0980e127-6744-378f-479a-e841f0a0d20e@vaisala.com>
X-Mailer: Evolution 3.28.2-1 
Mime-Version: 1.0
Subject: dealing with CMake ExternalProject (was: Re: [PATCH] cmake: Export SSH_AUTH_SOCK for cmake at configure)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 28 May 2018 12:21:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2018-05-28 at 11:55 +0300, Hannu Lounento wrote:
> On 25/05/18 18:34, Christopher Larson wrote:
> > We should probably investigate if it's possible to shift those into 
> > do_fetch eventually. Contacting upstream during do_configure is not
> > kosher.
> 
> The reason for fetching during configure is that the CMake build system 
> in the git repository in question (later referred to as the "parent 
> project") uses the ExternalProject keyword [1], which "creates a custom 
> target to drive download, update/patch, configure, build, install and 
> test steps of an external project" [1].
> 
> The external project that the aforementioned CMake build system uses is 
> gtest (later referred to as the "child project"), which is many times 
> built as part of a parent project. Usually git submodule is used to 
> clone child projects, which works nicely with Bitbake with the gitsm 
> fetcher. In this particular case the parent project uses the 
> ExternalProject keyword instead, which is one of the options suggested 
> in gtest's documentation [2]. While the parent project is not a public 
> open source project, it is not in our direct control either and hence we 
> cannot just change it to use git submodule instead.

You can simply instruct ExternalProject to refer to an existing (local)
directory, instead of a remote git repository.  Either by patching it in
your parent project's recipe, or trying to get upstream to integrate such a
change:

Something along the lines of this works fine for me here:

CMakeLists.txt:

find_path(GTEST_SRC_LOCATION
    NAMES googlemock/src/gmock-all.cc googletest/src/gtest-all.cc
    HINTS ENV GTEST_SRC_ROOT
    PATHS "/usr/src/googletest"
    NO_DEFAULT_PATH
    )
if (GTEST_SRC_LOCATION)
    set(GTEST_GIT_REPOSITORY "" CACHE INTERNAL "googletest git repository")
    set(GTEST_GIT_TAG        "" CACHE INTERNAL "googletest git tag")
else ()
    set(GTEST_GIT_REPOSITORY "https://github.com/google/googletest.git" CACHE INTERNAL "googletest git repository")
    set(GTEST_GIT_TAG        "release-1.8.0" CACHE INTERNAL "googletest git tag")
    set(GTEST_SRC_LOCATION "${CMAKE_CURRENT_BINARY_DIR}/googletest-src" CACHE INTERNAL "googletest source location")
endif ()
configure_file(CMakeLists.txt.in googletest-download/CMakeLists.txt)


And CMakeLists.txt.in contains (amongst others):

include(ExternalProject)
ExternalProject_Add(googletest
  GIT_REPOSITORY    ${GTEST_GIT_REPOSITORY}
  GIT_TAG           ${GTEST_GIT_TAG}
  SOURCE_DIR        "${GTEST_SRC_LOCATION}"


This way, you can have an independent recipe that downloads gtest, and the
recipe of your parent project just needs to ensure to depend on the
downloaded gtest and set the GTEST_SRC_ROOT environment variable. There even
is a debian package for the gtest source code (hence the /usr/src/googletest
above), so not only yocto builds, but even local workstation builds outside
yocto would benefit from such a change.

No need for dramatic changes (such as switching to git submodules).


Cheers,
Andre'



