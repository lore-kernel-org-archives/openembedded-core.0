Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f180.google.com (mail-ob0-f180.google.com
	[209.85.214.180])
	by mail.openembedded.org (Postfix) with ESMTP id A3A7A70295
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jul 2014 01:33:39 +0000 (UTC)
Received: by mail-ob0-f180.google.com with SMTP id vb8so7391762obc.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jul 2014 18:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=sBlI7r/7PrWuMO/wrc5jAlrAjuy2ft0oYvO/mnc2Dtc=;
	b=CCiLUa17t6Zo5PhekW/GKQF2O8Y8dD9PIwLP+sRQtCyu8imJCvBhEdwsZK+TNhRBN4
	t3NDRwU1aauOfYFiUIg8eq/ZMAmgjvojtBHNs/kmatW7dLllKFs1quwlcvLZ4WyNxlQx
	tcUzmLyJRHxuUD8tIyZguedkLnqcx6sYDGTDjhsK0gU5laOdQvcaNSBZfqkNZaj0HxMd
	o3iLqnQVDX/VeXDxEwE8vxNAISfjBqmmGj7QUK0RW1I3skujgguWIBsrSiSZcNgvM2Fc
	TNrgBDLxSyLIP9fdarsMg9Xr9950QfMGPIQDCArkZ/OsMgji89c3ZYioVWa2cS6ze9A8
	/gdA==
MIME-Version: 1.0
X-Received: by 10.182.121.170 with SMTP id ll10mr43852125obb.58.1404869620211; 
	Tue, 08 Jul 2014 18:33:40 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.50.135 with HTTP; Tue, 8 Jul 2014 18:33:40 -0700 (PDT)
In-Reply-To: <53BC8A76.3010608@linux.intel.com>
References: <1404266329-13524-1-git-send-email-joaohf@gmail.com>
	<1404266329-13524-3-git-send-email-joaohf@gmail.com>
	<53BC8A76.3010608@linux.intel.com>
Date: Tue, 8 Jul 2014 22:33:40 -0300
X-Google-Sender-Auth: gc78KTcABQhEevwn-kwDjj3oerg
Message-ID: <CAP9ODKpMVXway08KT0R+uyLr6V37ouCa038t_n-LzSOdDQ6h=g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
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
X-List-Received-Date: Wed, 09 Jul 2014 01:33:40 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hello Saul,

On Tue, Jul 8, 2014 at 9:19 PM, Saul Wold <sgw@linux.intel.com> wrote:
> On 07/01/2014 06:58 PM, Jo=C3=A3o Henrique Ferreira de Freitas wrote:
>>
>> When extracting toolchain, if the list $executable_files has filenames
>> with empty space character, the list will created but relocate_sdk.sh
>> will not handle it well. This will lead to the below erro:
>>
>>
>> ./tmp/deploy/sdk/buildtools-mytools-x86_64-nativesdk-standalone-1.6.1.0.=
sh
>>      Enter target directory for SDK (default:
>> /opt/mydistro/mytoolset/1.6.1.0):
>>      You are about to install the SDK to
>> "/opt/mydistro/mytoolset/1.6.1.0". Proceed[Y/n]?
>>      Extracting SDK...done
>>      Setting it up.../opt/mydistro/mytoolset/1.6.1.0/relocate_sdk.sh: li=
ne
>> 2: sintaxe error `token'  `('
>>      /opt/mydistro/mytoolset/1.6.1.0/relocate_sdk.sh: line 2: `e
>>
>> The same occurs with replacement of ${SDKPATH} in configs/scripts/etc
>> files.
>>
>> We should ensure that full path is protected before relocate_sdk.sh
>> and ${SDKPATH} replacement calls.
>>
>
> I am not sure about this one, there are other cases where spaces in
> filenames/directory pathes just don't work, so fixing one place may not
> address all issues, I thought this was documented someplace, but I can't
> seem to find the associated bug or wiki entries.
>
> Maybe someone else can remind me also where we talk about whitespace in
> pathe, obviously my search-fu is off right now.

I agree this problem should exist in other places but I think this
does not invalidate Joao's patch and it should be reviewed and merged
if correct.

Now talking about  the patch itself, Joao, did you try to avoid the
extra fork calling echo? Using '-print0' option in find might help.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

