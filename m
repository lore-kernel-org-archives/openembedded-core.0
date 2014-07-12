Return-Path: <joaohf@gmail.com>
Received: from mail-yh0-f44.google.com (mail-yh0-f44.google.com
	[209.85.213.44])
	by mail.openembedded.org (Postfix) with ESMTP id B8D2270252
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jul 2014 13:20:52 +0000 (UTC)
Received: by mail-yh0-f44.google.com with SMTP id f73so727313yha.17
	for <openembedded-core@lists.openembedded.org>;
	Sat, 12 Jul 2014 06:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=qgZxM24cFONHCRmdFkEwh5siEwW2NYkNMd8zJFXMT+Q=;
	b=XLNYZ09nGcqWgx0GAWNdJl88p4+uYYfsIQueWqoS/l4C0lxb1cFwUEQ5jQ6YNLzPOT
	aF4zbS6ePSvKGNCZuMQdnBf11/dQ32FcXw/+pffR6m5G51Yn5zkin+8RyVq1hIc9/NtZ
	IFvzsGnBG2nfFk3xxkdVEPrdQt+/3exASsgc+Mx6yKH9nyk5Z4U4ioPfr+HNNsixsnCm
	oURe1Y34YlM9mc3Op7BEbdojE6M/55UEszYXu3EvKuvl91QnOxk80zJ7aEU3TlEHfLKh
	Jmo843QaQeX8zbkXmJzPCCuPQvaY2HkayteCmJQwP8IS8KMufMAInaqX/dUWJLDMzX3X
	B/9w==
X-Received: by 10.236.193.9 with SMTP id j9mr2592975yhn.155.1405171253169;
	Sat, 12 Jul 2014 06:20:53 -0700 (PDT)
Received: from [192.168.0.12] ([201.53.220.248])
	by mx.google.com with ESMTPSA id s9sm10994014yhp.39.2014.07.12.06.20.50
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 12 Jul 2014 06:20:52 -0700 (PDT)
Message-ID: <53C1362F.9040006@gmail.com>
Date: Sat, 12 Jul 2014 10:20:47 -0300
From: =?UTF-8?B?Sm/Do28gSGVucmlxdWUgRmVycmVpcmEgZGUgRnJlaXRhcw==?=
	<joaohf@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, Saul Wold <sgw@linux.intel.com>
References: <1404266329-13524-1-git-send-email-joaohf@gmail.com>	<1404266329-13524-3-git-send-email-joaohf@gmail.com>	<53BC8A76.3010608@linux.intel.com>
	<CAP9ODKpMVXway08KT0R+uyLr6V37ouCa038t_n-LzSOdDQ6h=g@mail.gmail.com>
In-Reply-To: <CAP9ODKpMVXway08KT0R+uyLr6V37ouCa038t_n-LzSOdDQ6h=g@mail.gmail.com>
Cc: "Eggleton, Paul" <paul.eggleton@linux.intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] populate_sdk_base: ensure that filenames with empty space character are handled
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
X-List-Received-Date: Sat, 12 Jul 2014 13:20:59 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Hi Otavio

Em 08-07-2014 22:33, Otavio Salvador escreveu:
> Now talking about the patch itself, Joao, did you try to avoid the 
> extra fork calling echo? Using '-print0' option in find might help. 

Not until now. But I agree about your concern. So, instead of

executable_files=$($SUDO_EXEC find $native_sysroot -type f -perm /111 
-exec echo \'{}\' \;)

Its better do:

executable_files=$($SUDO_EXEC find $native_sysroot -type f -perm /111 
-printf "'%h/%f' ")

No extra fork was used with -printf "'%h/%f' ".

The argument -print0 is not an option because the output of find command 
will be 'path1 path2 path 3' a concatenation of strings not strings 
split by space and protected with ' '.

Both results are valid. But the second is nicer. What do you think?


When I did this patch I was not thinking to solve all problems about 
spaces in filename. However a deep dig is needed to track all points 
that have this issue.

Thanks.

-- 
João Henrique Ferreira de Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil


