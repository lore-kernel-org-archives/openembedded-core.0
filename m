Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f170.google.com (mail-yk0-f170.google.com
	[209.85.160.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1B5EE6FCE0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 01:33:58 +0000 (UTC)
Received: by mail-yk0-f170.google.com with SMTP id 9so10932400ykp.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Aug 2014 18:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=iOrA32lM25rc3id3JFRciqImOUhb0X85tS66VuWs9Wg=;
	b=PoZH8UwpfgXseauZItVitm9BLPkondNRCcRjJafdxKkowHnOhi8/KVBH7EwdwLnTcf
	kqKzeYo7mXFCsi6RgSv0Wt4ZjRunwMjeXWXp1NhgrGFu9rm5OAwqTClwK5L2dSsCjGVv
	6h3DnB3K+Udumy1zQqPTSHh17UzLRreEzmbPuo/gZGYm+1xl8yOPE+MIkNyKrw8WNMA9
	AQRCaF6VZzEVO/7raoGJhXbX5qBuGowt9WDDWhRf2+6huDw/ro0ZBXlIzSqRFadV1fYe
	E4h0iSbnv3zJa1lXycxwgSdI1ptwpnHpQnnOlxwOf8x10JkNKX34fGSYPCIfXg7uDK4r
	4T6w==
MIME-Version: 1.0
X-Received: by 10.236.151.231 with SMTP id b67mr35276026yhk.24.1409016839897; 
	Mon, 25 Aug 2014 18:33:59 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Mon, 25 Aug 2014 18:33:59 -0700 (PDT)
In-Reply-To: <201408152253.02781.marex@denx.de>
References: <1407425157-2736-1-git-send-email-marex@denx.de>
	<CAP9ODKpCTJTLg2iwP+JmL+X_dyj919gB0k85r2HtKNKy_nhd_w@mail.gmail.com>
	<201408152253.02781.marex@denx.de>
Date: Mon, 25 Aug 2014 22:33:59 -0300
X-Google-Sender-Auth: vylecEGyuj0dY0LAcUemAdQ6aJs
Message-ID: <CAP9ODKqsksd5H0LXkN-NWfPpuDJyRpN1CtiDTvUPLbGx9JhbYQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Marek Vasut <marex@denx.de>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Yocto: qt4: Let qmake control some compiler/linker flags
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
X-List-Received-Date: Tue, 26 Aug 2014 01:34:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 15, 2014 at 5:53 PM, Marek Vasut <marex@denx.de> wrote:
> On Monday, August 11, 2014 at 02:49:16 AM, Otavio Salvador wrote:
>> Hello Marek,
>>
>> On Thu, Aug 7, 2014 at 12:25 PM, Marek Vasut <marex@denx.de> wrote:
>> > In the case of building an Qt application outside of the Yocto
>> > build system, we want to make sure that a "debug" configuration
>> > of the application does contain debug symbols and is has the
>> > compiler optimalization unset. On the other hand, we want to
>> > have a "release" build which does not contain the debug symbols
>> > and has the compiler optimalization turned on.
>> >
>> > The OE_QMAKE_* flags serve to pass all kinds of flags into the
>> > qmake-generated Makefile. Currently, we set OE_QMAKE_CFLAGS to
>> > be ${CFLAGS} and ditto for CXXFLAGS and LDFLAGS in the SDK
>> > toolchain environment script. This poses a problem, since the
>> > CFLAGS can contain optimization options (-O*) and even flags to
>> > produce debugging info (-g). The LDFLAGS may also contain some
>> > harmful flags.
>> >
>> > The easy way out is to let qmake's army of configuration files
>> > handle the proper configuration of CFLAGS, CXXFLAGS and LDFLAGS
>> > for the generated Makefile and don't interfere with qmake's
>> > decisions by adding arbitrary flags. This patch completely
>> > scrubs OE_QMAKE_C{,XX}FLAGS and leaves only harmless flags in
>> > OE_QMAKE_LDFLAGS. With this patch, the behavior is as it is
>> > explained in the first paragraph.
>> >
>> > Signed-off-by: Marek Vasut <marex@denx.de>
>> > Cc: Eric B=C3=A9nard <eric@eukrea.com>
>>
>> I understand your problem however I don't think the solution you found
>> is optimal. It does fix the issue you refer in the commit log however
>> it also makes difficult for user to "reuse" default SDK flags to test
>> the application.
>
> What solution do you propose then?
>
> The default SDK flags effectively disallow qmake to operate correctly -- =
that
> is, to control the compiler/linker flags.

I understand your issue and I agree we need to address this somehow,
however we should not regret the usability we had before.

This remain unnoticed for such long time means people didn't notice
the lack of this so we need to find a way to support the debugging
without losing the use of SDK configured flags to release builds.

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

