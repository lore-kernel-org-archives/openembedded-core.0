Return-Path: <akuster808@gmail.com>
Received: from mail-qk0-f195.google.com (mail-qk0-f195.google.com
	[209.85.220.195])
	by mail.openembedded.org (Postfix) with ESMTP id 84175605B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 20:32:15 +0000 (UTC)
Received: by qkbx78 with SMTP id x78so5162581qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 13:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=P4ZtYMt8apT346QAj3Hc38CIKHrQfud9GMSjxxDjdog=;
	b=yFL0o5UEwx1ceaxs7Sfi84wPEgvR8XZb+w/NS04vMAsW8/sq3LwGWXkDjhsmzLJGv8
	eHyOliCeO/eTg5ogeCiwdob9QRDxe4GYlXHvRJfjXFJG6uhczwvS+cHjlu2jKMICBxN6
	rBIfq8CVrMtQ4yxWyk7gtx/4x6sakiGlBWfnEP9cup1knIGVZazb44nwvjT7gMegd+Yf
	xFNsvUC+gyK1cc5KMnOH4qQ907/5VaP/tH6HPv6W/ghMOuxn17YVXz/rGjN20RzpSWjX
	kKLSpXhX4gNMnGANv56rKAzv1J1FAIfa9zH4wtD7BhUSRoV8lvt6zwsixZxELVzsaBEm
	QJvQ==
X-Received: by 10.140.134.83 with SMTP id 80mr21736336qhg.28.1434141135888;
	Fri, 12 Jun 2015 13:32:15 -0700 (PDT)
Received: from ?IPv6:2601:c:a700:3ba7:c068:52f2:f8c5:dff1?
	([2601:c:a700:3ba7:c068:52f2:f8c5:dff1])
	by mx.google.com with ESMTPSA id c13sm2147166qkh.15.2015.06.12.13.32.13
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 12 Jun 2015 13:32:14 -0700 (PDT)
Message-ID: <557B41C4.2090607@gmail.com>
Date: Fri, 12 Jun 2015 13:32:04 -0700
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1433446500.git.akuster808@gmail.com>
	<f1d8a6d07dbe8a5093fb327bccd2b4744b570b1f.1433446500.git.akuster808@gmail.com>
	<CAJTo0LYABsnZBRP64=vx0a9prDvUuBmpg_6BYn1FcTGf_rokyw@mail.gmail.com>
In-Reply-To: <CAJTo0LYABsnZBRP64=vx0a9prDvUuBmpg_6BYn1FcTGf_rokyw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] neon: build fix
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
X-List-Received-Date: Fri, 12 Jun 2015 20:32:16 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit


Ok, I got this working. I will submit a new pull request soon.

- armin

On 06/09/2015 12:02 PM, Burton, Ross wrote:
> On 4 June 2015 at 20:37, Armin Kuster <akuster808@gmail.com
> <mailto:akuster808@gmail.com>> wrote:
>
>     fixup to allow building with api changes in gnutls.
>
>
> My world builds shows that libmusicbrainz was failing due to neon not
> linking, and to demonstrate this I added this to neon.bb <http://neon.bb>:
>
> do_compile_append() {
> oe_runmake -C test
> }
>
> Et voila:
>
> | ../x86_64-poky-linux-libtool --silent --mode=link
> x86_64-poky-linux-gcc  -m64 -march=corei7 -mtune=corei7 -mfpmath=sse
> -msse4.2 --sysroot=/data/poky-master/tmp/sysroots/intel-corei7-64
> -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -no-install -o lock lock.lo
> libtest.la <http://libtest.la>
> |
> /data/poky-master/tmp/work/corei7-64-poky-linux/neon/0.30.1-r0/build/src/.libs/libneon.so:
> undefined reference to `gnutls_certificate_client_set_retrieve_function'
> |
> /data/poky-master/tmp/work/corei7-64-poky-linux/neon/0.30.1-r0/build/src/.libs/libneon.so:
> undefined reference to `gnutls_certificate_client_set_retrieve_function'
>
> Neon still doesn't build with the new gnutls.
>
> Ross

