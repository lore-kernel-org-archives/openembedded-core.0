Return-Path: <net147@gmail.com>
Received: from mail-vb0-f45.google.com (mail-vb0-f45.google.com
	[209.85.212.45])
	by mail.openembedded.org (Postfix) with ESMTP id A3CF860420
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jun 2013 03:11:31 +0000 (UTC)
Received: by mail-vb0-f45.google.com with SMTP id 12so1612050vbf.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Jun 2013 20:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=8Ow7Qly+lGVUraOZ5D2pRkzZdJv3ygS3HArkf8P56Hs=;
	b=ctX3hLeZyneMfQva/eRGILSsuLBKNGgvhHInVB/Cns8InR+8fwSFVMaoRr4/Xc/nbA
	m+gWQh1ZIeaSE5poeN5mvhRZvYJFkl7PliK1FM/jk7hHKGS+9NKdUiE85GoTb2GRtJpL
	ZSPNfESMXCph/A0BVY2pEZWZT+okiMy9L80jiAxHYWZVLK/f2fPbqFMmkIq+XUe39V43
	xA5AH5u0k5LEjfQHf5ZSP3ycKkr5Tob2+MKB0JUDub9qcq8AY1WmXphlEGstxGqpvsN0
	2zB7NkWyTqe6JeUPZatPpb09qBM2aeSqYlezlN26G6don96hNkb5QXnhGxbl0oc0X5W5
	IInA==
MIME-Version: 1.0
X-Received: by 10.58.75.41 with SMTP id z9mr11114171vev.4.1370488292290; Wed,
	05 Jun 2013 20:11:32 -0700 (PDT)
Received: by 10.58.34.132 with HTTP; Wed, 5 Jun 2013 20:11:32 -0700 (PDT)
In-Reply-To: <2653566.bBSFCXsGIZ@helios>
References: <1370422910-24366-1-git-send-email-net147@gmail.com>
	<51AF6B79.3040506@linux.intel.com> <2054363.UxqkIOrzAJ@helios>
	<2653566.bBSFCXsGIZ@helios>
Date: Thu, 6 Jun 2013 13:11:32 +1000
Message-ID: <CANwerB3EF73JEhoXUNneq4wXCbnQzyCqPx1WUMpjB8DQ-e1qeg@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] qmake2.bbclass: export OE_QMAKE_QT_CONFIG
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
X-List-Received-Date: Thu, 06 Jun 2013 03:11:32 -0000
Content-Type: text/plain; charset=UTF-8

On 6 June 2013 03:04, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> On Wednesday 05 June 2013 17:57:32 Paul Eggleton wrote:
>> On Wednesday 05 June 2013 09:46:49 Saul Wold wrote:
>> > On 06/05/2013 02:30 AM, Martin Jansa wrote:
>> > > On Wed, Jun 05, 2013 at 07:01:50PM +1000, Jonathan Liu wrote:
>> > >> qconfig.pri was not being loaded by qmake properly. This means Qt
>> > >> qmake projects are unable to query QT_ARCH, QT_VERSION and other
>> > >> variables defined in qconfig.pri.
>> > >>
>> > >> Export OE_QMAKE_QT_CONFIG, setting it to the location of qconfig.pri
>> > >> so that it can be located by qmake.
>> > >
>> > > There is such patch already:
>> > > http://lists.openembedded.org/pipermail/openembedded-core/2013-May/07831
>> > > 4.
>> > > html
>> >
>> > Got lost in my queue, adding it for the next MUT.
>>
>> FWIW I am still concerned by the assertion in the commit message about it
>> causing undesirable behaviour. I'd want that checked out and the note
>> removed before we look at merging this.
>
> (I mean undesirable behaviour on rebuild after applying this patch; I should
> mention I'm testing this at the moment.)

Please test it in combination with the patch I just submitted which
fixes QMAKE_QT_CONFIG being overwritten with empty value from
.qmake.cache. I needed it to build Qt Creator.

You can do a basic test as follows:
bitbake -c devshell fotowall
mkdir test
cd test
echo 'message(Qt Version: $$QT_VERSION)' > test.pro
qmake2 test.pro

Regards,
Jonathan

