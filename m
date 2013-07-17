Return-Path: <net147@gmail.com>
Received: from mail-pb0-f53.google.com (mail-pb0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1ADF86B251
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 09:54:12 +0000 (UTC)
Received: by mail-pb0-f53.google.com with SMTP id xb12so1701803pbc.40
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jul 2013 02:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=de8MK0AN1ZElI04iniqooPHF3LUPNhTtXZvOgpWvs8g=;
	b=zKkbk9BUrTTi5Syc7sq1UzYrkktsZWL2Xqj4B62xOZpltCU4N9XyP2JdhM1s21tTM9
	zEvrImmo2590SCMsuHXBNxUmVBdJ1KnzMo/qtKleO/+mPp9x/33siF1aqanTDGDoDyPh
	A4KUCXnTJ1hbz6K1DG1J9ZKUkXucifqjrB2ZPZhZATLGcu1uzhUXBIYWAoaRoRv0s308
	rzIvLOsBkVK3a5dreSSvAqBfAZv6oFm3dZjvKSHaeViHfMCArI7FYMSLrY3MAxpjUjyj
	OLnRhV383fiEwED12F8HuJd6x5gNn5ozO/pAGH98lJyOauBNbXW4UJ97o52qjMs2WfOQ
	Anxg==
X-Received: by 10.66.155.163 with SMTP id vx3mr7007136pab.67.1374054852607;
	Wed, 17 Jul 2013 02:54:12 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id ot4sm9520320pac.17.2013.07.17.02.54.10
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 17 Jul 2013 02:54:11 -0700 (PDT)
Message-ID: <51E6689B.8060400@gmail.com>
Date: Wed, 17 Jul 2013 19:49:15 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
References: <1374050422-5056-1-git-send-email-net147@gmail.com>
	<51E66038.8000109@herbrechtsmeier.net>
In-Reply-To: <51E66038.8000109@herbrechtsmeier.net>
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
X-List-Received-Date: Wed, 17 Jul 2013 09:54:12 -0000
Content-Type: text/plain; charset=ISO-8859-15; format=flowed
Content-Transfer-Encoding: 7bit

On 17/07/2013 7:13 PM, Stefan Herbrechtsmeier wrote:
> Am 17.07.2013 10:40, schrieb Jonathan Liu:
>> The CMAKE_{AR,LINKER,NM,OBJCOPY,OBJDUMP,RANLIB,STRIP} cmake variables
>> are currently set to values like CMAKE_LINKER-NOTFOUND for native
>> recipes because the host paths are not searched. This is because the
>> CMAKE_FIND_ROOT_PATH_MODE_PROGRAM cmake variable is set to ONLY.
>>
>> To resolve this, explicitly set the variables using FIND_PROGRAM and
>> pass the CMAKE_FIND_ROOT_PATH_BOTH option so the host paths are also
>> searched.
> Can you please debug the issue. Regarding my current check the 
> variables are set in CMakeFindBinUtils.cmake and this is included by 
> CMakeDetermineCCompiler.cmake. The later set _CMAKE_TOOLCHAIN_LOCATION 
> based on the CMAKE_C_COMPILER variable and this is used as search 
> location for the find_program calls. Can you check the value of 
> _CMAKE_TOOLCHAIN_LOCATION?
>
Within the context of the CMakeLists.txt file:
CMAKE_C_COMPILER is /usr/bin/gcc.
_CMAKE_TOOLCHAIN_LOCATION is not set to anything.

If I add message(test) to 
build/tmp/sysroots/x86_64-linux/usr/share/cmake-2.8/Modules/CMakeDetermineCCompiler.cmake, 
it doesn't get printed out when running cmake on CMakeLists.txt (cmake 
is build/tmp/sysroots/x86_64-linux/usr/bin/cmake).

Regards,
Jonathan

