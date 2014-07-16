Return-Path: <joaohf@gmail.com>
Received: from mail-vc0-f180.google.com (mail-vc0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 975B07050E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 03:01:58 +0000 (UTC)
Received: by mail-vc0-f180.google.com with SMTP id ij19so535024vcb.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 20:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=fDhAjeLaui09xkaqQQZH0xFjHwob0Zo7RU4X4dEeero=;
	b=ua46vYjSHXX0jc2QVnj/jzqpmlTAbc2X4kdHyhzhbsiAtLJy+WuOCjf65RBHinFw64
	g+5oswYsaHqLIAQ8yY4Aq18uu29nUSw+52UlpRb8frF/ps/8u7CmK/j6thoW7Jq2+svW
	1/az3iQcl5Ch3CJ19fmnd2qiBlNt1s9yOnk97CVQMlzdvtoMcVQqMp8eb510PaNkcamB
	XpBZpLkpKR0vB+UUZHtQgCAV2N++TY8Q3DKsPdSdkZqbe8mVWvuN/bRQmQwUaRBk0mlN
	FFa7KwnDVy7WS6gMkNvX97PlwXyfCtpSuJX2NaoSR0Tje3jasRFfCiQ2QMVP1eYJ579t
	PB2w==
X-Received: by 10.220.133.13 with SMTP id d13mr634030vct.66.1405479719263;
	Tue, 15 Jul 2014 20:01:59 -0700 (PDT)
Received: from [192.168.0.12] ([201.53.220.248])
	by mx.google.com with ESMTPSA id
	ft3sm20032475vdb.22.2014.07.15.20.01.57 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 15 Jul 2014 20:01:58 -0700 (PDT)
Message-ID: <53C5EB22.6070700@gmail.com>
Date: Wed, 16 Jul 2014 00:01:54 -0300
From: =?UTF-8?B?Sm/Do28gSGVucmlxdWUgRmVycmVpcmEgZGUgRnJlaXRhcw==?=
	<joaohf@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <1404266329-13524-1-git-send-email-joaohf@gmail.com>	<1405378518-4832-1-git-send-email-joaohf@gmail.com>	<1405378518-4832-3-git-send-email-joaohf@gmail.com>
	<CAP9ODKr1fxmPVE3ejC0T8JCYpyOPk9dWjoPCZw4Mwv8s-QS+Xw@mail.gmail.com>
In-Reply-To: <CAP9ODKr1fxmPVE3ejC0T8JCYpyOPk9dWjoPCZw4Mwv8s-QS+Xw@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 2/2] populate_sdk_base: ensure that filenames with empty space character are handled
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
X-List-Received-Date: Wed, 16 Jul 2014 03:02:03 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Em 15-07-2014 10:33, Otavio Salvador escreveu:
> On Mon, Jul 14, 2014 at 7:55 PM, João Henrique Ferreira de Freitas
> <joaohf@gmail.com> wrote:
>> When extracting toolchain, if the list $executable_files has filenames
>> with empty space character, the list will created but relocate_sdk.sh
>> will not handle it well. This will lead to the below erro:
>>
>>      ./tmp/deploy/sdk/buildtools-mytools-x86_64-nativesdk-standalone-1.6.1.0.sh
>>      Enter target directory for SDK (default: /opt/mydistro/mytoolset/1.6.1.0):
>>      You are about to install the SDK to "/opt/mydistro/mytoolset/1.6.1.0". Proceed[Y/n]?
>>      Extracting SDK...done
>>      Setting it up.../opt/mydistro/mytoolset/1.6.1.0/relocate_sdk.sh: line 2: sintaxe error `token'  `('
>>      /opt/mydistro/mytoolset/1.6.1.0/relocate_sdk.sh: line 2: `e
>>
>> The same occurs with replacement of ${SDKPATH} in configs/scripts/etc files.
>>
>> We should ensure that full path is protected before relocate_sdk.sh
>> and ${SDKPATH} replacement calls.
>>
>> Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
> I am wondering if we cannot get rid of the 'tr' command that converts
> newlines to '\0'. This would avoid a new fork of command. Did you
> think about it?
>
I think it's possible. Maybe  using: awk -F':' '{printf "%s\0", $1}' 
like this:

$SUDO_EXEC find $native_sysroot -type f -exec file '{}' \;|grep 
":.*\(ASCII\|script\|source\).*text"|awk -F':' '{printf "%s\0", 
$1}'|$SUDO_EXEC xargs -0 sed -i -e 
"s:$DEFAULT_INSTALL_DIR:$target_sdk_dir:g"

I will finish my tests before send a v3.

Thanks.

-- 
João Henrique Ferreira de Freitas - joaohf_at_gmail.com
Campinas-SP-Brasil


