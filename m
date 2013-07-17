Return-Path: <net147@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 8D9ED6B1C3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 11:02:47 +0000 (UTC)
Received: by mail-pa0-f42.google.com with SMTP id rl6so1843598pac.29
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 04:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=xBSQskRM4FHJkQQp6LyAhlzVL8MUQVHAmaxVbDktxLo=;
	b=jwLO/fBhXMxuEPQbVf+UiAnYs2Lsi09uvcHzWwfRoB5LWUD6J2FM+ULrEd450MkM8o
	7IOV0tgvpdH7gmL5Hmv6fOhBfRL0tWYT+Xin523otLkiXd5wwc5Dcd5F88T7/NY87cX4
	Albz5MvirbZdlzltip2BoO9nYRttUz+fQ1N9T9HI0AVTtBtyeTsReiU9NE6hRNlQrUhe
	COszdGIJNOGFwJetVM7LldaMi2YBkl1dD1hADgjgZOq/hE0QkVSFQP7CuEJUog9akWVt
	cbyGGuXymuCo9mg2ClcpvptDbOFfC7f+88QdlAlWL0Gipc0ozMNdbhesnl3H4JT52QiK
	qcYA==
X-Received: by 10.66.164.199 with SMTP id ys7mr7368885pab.104.1374058968189;
	Wed, 17 Jul 2013 04:02:48 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id vo8sm7303127pbc.5.2013.07.17.04.02.45
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 17 Jul 2013 04:02:47 -0700 (PDT)
Message-ID: <51E678AF.2010001@gmail.com>
Date: Wed, 17 Jul 2013 20:57:51 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
References: <1374050422-5056-1-git-send-email-net147@gmail.com>
	<51E66038.8000109@herbrechtsmeier.net> <51E6689B.8060400@gmail.com>
In-Reply-To: <51E6689B.8060400@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cmake.bbclass: set ar/ld/nm/objcopy/objdump/ranlib/strip native paths
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
X-List-Received-Date: Wed, 17 Jul 2013 11:02:47 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

On 17/07/2013 7:49 PM, Jonathan Liu wrote:
> On 17/07/2013 7:13 PM, Stefan Herbrechtsmeier wrote:
>> Am 17.07.2013 10:40, schrieb Jonathan Liu:
>>> The CMAKE_{AR,LINKER,NM,OBJCOPY,OBJDUMP,RANLIB,STRIP} cmake variables
>>> are currently set to values like CMAKE_LINKER-NOTFOUND for native
>>> recipes because the host paths are not searched. This is because the
>>> CMAKE_FIND_ROOT_PATH_MODE_PROGRAM cmake variable is set to ONLY.
>>>
>>> To resolve this, explicitly set the variables using FIND_PROGRAM and
>>> pass the CMAKE_FIND_ROOT_PATH_BOTH option so the host paths are also
>>> searched.
>> Can you please debug the issue. Regarding my current check the 
>> variables are set in CMakeFindBinUtils.cmake and this is included by 
>> CMakeDetermineCCompiler.cmake. The later set 
>> _CMAKE_TOOLCHAIN_LOCATION based on the CMAKE_C_COMPILER variable and 
>> this is used as search location for the find_program calls. Can you 
>> check the value of _CMAKE_TOOLCHAIN_LOCATION?
>>
> Within the context of the CMakeLists.txt file:
> CMAKE_C_COMPILER is /usr/bin/gcc.
> _CMAKE_TOOLCHAIN_LOCATION is not set to anything.
>
> If I add message(test) to 
> build/tmp/sysroots/x86_64-linux/usr/share/cmake-2.8/Modules/CMakeDetermineCCompiler.cmake, 
> it doesn't get printed out when running cmake on CMakeLists.txt (cmake 
> is build/tmp/sysroots/x86_64-linux/usr/bin/cmake).
>
> Regards,
> Jonathan
For:
find_program(CMAKE_AR NAMES 
${_CMAKE_TOOLCHAIN_PREFIX}ar${_CMAKE_TOOLCHAIN_SUFFIX} HINTS 
${_CMAKE_TOOLCHAIN_LOCATION})

It seems the ${_CMAKE_TOOLCHAIN_LOCATION} hint is not used when 
CMAKE_FIND_ROOT_PATH_MODE_PROGRAM is set to ONLY.

Test case (CMakeLists.txt):
cmake_minimum_required(VERSION 2.8)
set(CMAKE_FIND_ROOT_PATH /var/empty)
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY)
FIND_PROGRAM(LD NAMES ld HINTS /usr/bin)
message(${LD})

Running cmake displays:
LD-NOTFOUND

If "set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM ONLY)" is commented out, it 
displays /usr/bin/ld.

Regards,
Jonathan


