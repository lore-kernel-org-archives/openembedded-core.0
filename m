Return-Path: <philip.lorenz@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09867C47DD9
	for <webhook@archiver.kernel.org>; Wed, 28 Feb 2024 15:22:45 +0000 (UTC)
Received: from esa14.hc324-48.eu.iphmx.com (esa14.hc324-48.eu.iphmx.com [207.54.69.24])
 by mx.groups.io with SMTP id smtpd.web11.16120.1709133758513708437
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Feb 2024 07:22:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=kAOUT7I1;
 spf=pass (domain: bmw.de, ip: 207.54.69.24, mailfrom: prvs=781c072f5=philip.lorenz@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1709133758; x=1740669758;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=+Xk5c6lF0YLfPrjadtdwxTNDw8aqTctONRtKP6kLSZg=;
  b=kAOUT7I14C5LlcI6pZsDHV9Sr2McEuAHtoNegCjpPhvl0IGQQHKBjLYZ
   VkoOlW+a07gi09Hym4OdOsJdLVSf176XVrzI4CjirwsbMDvxK6J/2Ab6w
   hhxWnRSoeggGaroZTGzAs31dhyVKpkJHcgF7bsyyj61Um25dcp1HHrekB
   E=;
X-CSE-ConnectionGUID: CB1rmi8ZQjKLrQuxJ6xFaw==
X-CSE-MsgGUID: ucQ9vGKjTlKYUPqr9wHgnw==
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa14.hc324-48.eu.iphmx.com with ESMTP/TLS; 28 Feb 2024 16:22:36 +0100
Received: from esabb4.muc ([160.50.100.33])  by esagw6.muc with ESMTP/TLS;
 28 Feb 2024 16:22:32 +0100
Received: from smucmp10e.bmwgroup.net (HELO SMUCMP10E.europe.bmw.corp) ([10.30.13.87])
 by esabb4.muc with ESMTP/TLS; 28 Feb 2024 16:22:32 +0100
Received: from [10.242.8.62] (10.30.85.200) by SMUCMP10E.europe.bmw.corp
 (2a03:1e80:a15:58f::2027) with Microsoft SMTP Server (version=TLS;
 Wed, 28 Feb 2024 16:22:31 +0100
Message-ID: <7c7ed8fd-84dd-4605-8b3f-0381607deea8@bmw.de>
Date: Wed, 28 Feb 2024 16:22:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [RFC PATCH 0/1] package.bbclass: Expose list of split
 out debug files
To: Alexander Kanavin <alex.kanavin@gmail.com>
CC: <openembedded-core@lists.openembedded.org>
References: <20240228062139.473528-1-philip.lorenz@bmw.de>
 <CANNYZj8E+pdih9P8j-T+9N1=qxcAEir74xNpdGu2sA6ZtcSOvA@mail.gmail.com>
From: Philip Lorenz <philip.lorenz@bmw.de>
In-Reply-To: <CANNYZj8E+pdih9P8j-T+9N1=qxcAEir74xNpdGu2sA6ZtcSOvA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SMUCMP04G.europe.bmw.corp (2a03:1e80:a15:58f::217e) To
 SMUCMP10E.europe.bmw.corp (2a03:1e80:a15:58f::2027)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Feb 2024 15:22:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196389

Hi Alex,

On 28.02.24 08:41, Alexander Kanavin wrote:
> On Wed, 28 Feb 2024 at 07:22, Philip Lorenz <philip.lorenz@bmw.de> wrote:
>> However, this relies on debuginfod scraping the debug packages for their
>> build IDs. This is not only inefficient (as all packages need to be
>> extracted again), but it also does not scale well when covering a large
>> number of builds.
> Is it possible to see numbers behind this claim? When there is a
> proposal to increase code complexity, that needs to be justified in a
> way that can be locally observed.

Let me provide some numbers based on both an internal medium-sized build 
based on kirkstone as well as a core-image-minimal build based on master.

Kirkstone:

> find -name "*.ipk" | wc
>    8415    8415  615076
> du -h -c
> 3.5G    total

> time /bin/sh -c 'for f in */*.ipk; do ar p $f data.tar.xz | tar -tJ > 
> /dev/null; done'
>
> real    5m13.629s
> user    4m56.653s
> sys     1m41.578s

master (core-image-minimal):

> find -name "*.ipk" | wc
>    4553    4553  287890
> du -h -c
> 2.1G    total

> time /bin/sh -c 'for f in */*.ipk; do ar p $f data.tar.zst | tar 
> --zstd -t > /dev/null; done'
>
> real    1m2.521s
> user    0m40.876s
> sys     1m8.232s
Exact figures of course vary and this can be further optimized by 
introducing parallelism. However, given that the artifacts are available 
uncompressed during packaging and the packaging step is also the one 
responsible for splitting out the debug symbols so limiting build ID 
extraction to the files that are known to contain debug symbols also is 
an efficiency win (and one also avoid implementing any kind of 
heuristics to determine which files actually contain the debug symbols).

>
>> Is this extension something that is viable to be merged? We are
>> considering open-sourcing the other parts needed to implement the setup
>> described above, but as those parts are still in the prototyping phase,
>> it will require some more time.
> The patch looks okay, but it's not useful without those other parts,
> so you need to get them ready and submit the whole set.

I'll answer this as part of my reply to Richard. I'd be more than happy 
to share the tooling we use to produce the build ID metadata and this 
was more an issue of where to actually place it. The only thing that is 
not yet in a state ready for public consumption is our daemon that 
consumes this metadata and then transparently fulfills any incoming 
debuginfo requests by retrieving the debug file from the corresponding 
package.

Br,

Philip

-- 
Philip Lorenz
BMW Car IT GmbH, Software-Plattform, -Integration Connected Company, Lise-Meitner-Straße 14, 89081 Ulm
-------------------------------------------------------------------------
BMW Car IT GmbH
Management: Chris Brandt and Michael Böttrich
Domicile and Court of Registry: München HRB 134810
-------------------------------------------------------------------------


