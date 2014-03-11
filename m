Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f180.google.com (mail-ve0-f180.google.com
	[209.85.128.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5F8D76F8BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 19:24:35 +0000 (UTC)
Received: by mail-ve0-f180.google.com with SMTP id jz11so9146436veb.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 12:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=X/Jo02PjMOTcfupfipPELorA7stg3a5nKhN/oTQIEQg=;
	b=xszuk1KQ0VdgZgjfRd4pWVYRC3viTSsSL0y9klKd0knm7+r6Zs2uwrP3t0ejJQMpOX
	IfRQNN7alM6T4hohmyTUdkjmQjo3p5D1LG502k6jTrglNILSampuRmcpJxdRYN8m5lKz
	Y3bIbNCDGSkE8nbJsHHTcyCTapZRyV3a2nDC5b2uBdQm7Hbrz2Xgn5a9Zbh3m5B2Q48J
	hl0kxQ7/2dGe1YgtPsHlyrjq6s18GSNbx/j8bDhPekSGrGOaEYj7R28kkPA3rcx0XJx5
	w0VXUez9OgbbMwPPKU7xHal/GQfdAHHXcIMh6AOcOmc5Zsdvb2Ax6MQxoqD5jpzF+fad
	Q05w==
X-Received: by 10.52.113.1 with SMTP id iu1mr1399453vdb.35.1394565876673; Tue,
	11 Mar 2014 12:24:36 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Tue, 11 Mar 2014 12:23:50 -0700 (PDT)
In-Reply-To: <531E0149.7010905@linux.intel.com>
References: <1394153667-4247-1-git-send-email-paul@paulbarker.me.uk>
	<1394153667-4247-2-git-send-email-paul@paulbarker.me.uk>
	<531E0149.7010905@linux.intel.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Tue, 11 Mar 2014 19:23:50 +0000
X-Google-Sender-Auth: dTNUqRMOSDr59UWTvB65INziSD0
Message-ID: <CANyK_8eb29MDTxadMxVF+G+P5PYZMgH4sr3fyD16-tXNOYHj-w@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python3: Add ptest support
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
X-List-Received-Date: Tue, 11 Mar 2014 19:24:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 10 March 2014 18:15, Saul Wold <sgw@linux.intel.com> wrote:
> On 03/06/2014 04:54 PM, Paul Barker wrote:
>>
>> A run-ptest script written in python is added which defines a new
>> TestRunner
>> subclass which prints test results in the required ptest format and then
>> executes python's built-in testsuite using this new TestRunner subclass.
>>
>> The built-in testsuite is included in the python standard library and we
>> ensure
>> we have the complete library by adding ${PN}-modules and ${PN}-misc to the
>> RDEPENDS for the ptest package. We also require libgcc for pthread
>> support.
>>
>> Tested on qemux86. Several tests fail and many skip; further investigation
>> should be done to check that the current status is acceptable. In
>> addition, the
>> testsuite causes an out-of-memory crash when qemu is configured with 256
>> MB of
>> RAM. The testsuite completes without crashing with 1 GB RAM.
>>
>> Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
>> ---
>> <snip>
>
> Seems like there is an issue with the multi-lib build.
>
> ERROR: QA Issue: lib32-python3: Files/directories were installed but not
> shipped
>   /usr/lib/python3
>   /usr/lib/python3/ptest
> NOTE: recipe lib32-pulseaudio-4.0-r0: task do_package_write_rpm: Started
>
> Sau!
>
>
>
>> +# This must come after inherit ptest for the override to take effect
>> +do_install_ptest() {
>> +    install -m 0755 -d ${D}/${libdir}/python3/ptest
>> +    install -m 0755 ${S}/../run-ptest ${D}/${libdir}/${PN}/ptest
>> +}

Should I be using something other than ${libdir} here? I can see
${PTEST_PATH} used in the do_install_ptest function for python2,
should I be using that instead?

As I think I noted elsewhere, this is the first ptest related patch
I've done so I don't really know much beyond what's documented at
https://wiki.yoctoproject.org/wiki/Ptest.

Cheers,

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

