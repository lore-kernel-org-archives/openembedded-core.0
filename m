Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f43.google.com (mail-yh0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id E0CA1726FB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Dec 2014 16:32:07 +0000 (UTC)
Received: by mail-yh0-f43.google.com with SMTP id z6so4110897yhz.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Dec 2014 08:32:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=rlpYvFqxSAdh1Zn9/TKylmrozBieka7Yc6fejwblXgM=;
	b=0fp92LS1ASZN06fP96OqGUadCj56fThxJks2cT10LW4MxgBCTi0RqrviFMioORKb88
	YDmZCPNIhYRBMHPduC2WQUrkd/pwM07QthqKJcMV5TlxPLI8BdrhcUiiuhg6/G9ABkiY
	5aiCXstNTFf8mqAKZQAJ5pmvEAAcO2xQPpu51GWz6JbIzEMZ7NT40/7h3eLVEjyRgAfW
	hSvQUbxydr26szjX/oVA0wLHfi13X4NA3hkFBGB5Ph2aN6lniTVEr4j+jY6jZExvKxdD
	GvSYGvO6Rm3ZrSaUNMEbxellPFbtttKobcGke9BmrIR85WhPp9SYm9+u0pgmIWeUXkN2
	t+IQ==
MIME-Version: 1.0
X-Received: by 10.170.211.67 with SMTP id c64mr31134624ykf.110.1419438727889; 
	Wed, 24 Dec 2014 08:32:07 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Wed, 24 Dec 2014 08:32:07 -0800 (PST)
In-Reply-To: <1419410769.6428.15.camel@linuxfoundation.org>
References: <1418159277-3620-1-git-send-email-otavio@ossystems.com.br>
	<1419410769.6428.15.camel@linuxfoundation.org>
Date: Wed, 24 Dec 2014 14:32:07 -0200
X-Google-Sender-Auth: U--AYvwNpdREsyd9jMW9msuxtEw
Message-ID: <CAP9ODKr+o_6vJ8AwjRRvuwTGmaq8JyrtCAHspEADKJA3Lgz=Yg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/3] image_types.bbclass: Respect IMAGE_TYPEDEP dependencies
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
X-List-Received-Date: Wed, 24 Dec 2014 16:32:08 -0000
Content-Type: text/plain; charset=UTF-8

Hello Richard,

On Wed, Dec 24, 2014 at 6:46 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Tue, 2014-12-09 at 19:07 -0200, Otavio Salvador wrote:
>> The IMAGE_TYPEDEP dependencies also need to be taken into account when
>> building an IMAGE_FSTYPE.
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>> ---
>>  meta/classes/image_types.bbclass | 2 ++
>>  1 file changed, 2 insertions(+)
>
> According to my tests, something in this patch series is causing:
>
> https://autobuilder.yoctoproject.org/main/builders/minnow/builds/137/steps/BuildImages/logs/stdio
> https://autobuilder.yoctoproject.org/main/builders/minnow-lsb/builds/138/steps/BuildImages/logs/stdio
> https://autobuilder.yoctoproject.org/main/builders/nightly-x86/builds/137/steps/BuildImages_1/logs/stdio
> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-64/builds/138/steps/BuildImages_1/logs/stdio
> https://autobuilder.yoctoproject.org/main/builders/nightly-x86-lsb/builds/138/steps/BuildImages_1/logs/stdio
>
> I could reproduce locally just by building anything with a live image
> type and executing do_bootimg. It appears the ".gz" version of the
> initramfs isn't created. You have to force stamps to get the code to
> rerun.

I could reproduce the issue using the 'genericx86' machine.

After some investigation the culprit for the issue has been found.
When I changed the code to account for the base type dependency, I
mistakenly changed the node to use.

So the fix was easy: http://privatepaste.com/4389a3a857

Thanks for the detailed report, this made my life easier when trying
to reproduce the failing case. I have successfully build
core-image-minimal for 'genericx86' and 'imx6qsabresd' machines. The
last was the one which raised the need of base type dependency rework,
by the way.

I sent a v2 patchset with this fixed.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

