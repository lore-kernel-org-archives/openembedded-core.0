Received: from avasout06.plus.net (avasout06.plus.net [212.159.14.18])
 by mx.groups.io with SMTP id smtpd.web10.10239.1628701026466823284
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Aug 2021 09:57:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mcrowe.com header.s=20191005 header.b=L+JwPuk0;
 spf=pass (domain: mcrowe.com, ip: 212.159.14.18, mailfrom: mac@mcrowe.com)
Received: from deneb.mcrowe.com ([80.229.24.9])
	by smtp with ESMTP
	id DrXKmLTKSHBkXDrXMm3hX5; Wed, 11 Aug 2021 17:57:04 +0100
X-Clacks-Overhead: "GNU Terry Pratchett"
X-CM-Score: 0.00
X-CNFS-Analysis: v=2.3 cv=fI+iIaSe c=1 sm=1 tr=0
 a=E/9URZZQ5L3bK/voZ0g0HQ==:117 a=E/9URZZQ5L3bK/voZ0g0HQ==:17
 a=kj9zAlcOel0A:10 a=MhDmnRu9jo8A:10 a=-An2I_7KAAAA:8 a=8AHkEIZyAAAA:8
 a=x9qErrpt8xjmSUaM7xAA:9 a=CjuIK1q_8ugA:10 a=Sq34B_EcNBM9_nrAYB9S:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mcrowe.com;
	 s=20191005; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description; bh=wtVxfTFaCC4NeLLqhq/nBLDpudcnng8Otn2frhKNPHk=; b=L+JwP
	uk0XM9rngTQHfnBsd1giKIBuryk++T95+v8TgbtJOfOYjwfwvz9YYv6WjFK8/W/nnKIEYaTF9/whj
	QqaHzSkWGtejgPfFmzfLBEcCdOWzC9+v1lKFOfCIFxSUBjfs0DUEPclLuCZfEUnBZ/on0y2Fs5j3b
	DTjaHC3Auis0HqXHy2GOCf9ORETy2nHiTMKyPyZ407lqJ4UiT7frKB+4Bwgy7ZsF4AOBJL0oG+NMk
	KA0iIOvAL6Co60W4DIotAqWlFLDKgb8w+h9OUEpssbOcvNW9kioMfGJzrjUWatFEzn7vfYHXO/jiV
	8BeLSH4/LHaUMasglG5fgHsELyr1g==;
Received: from mac by deneb.mcrowe.com with local (Exim 4.92)
	(envelope-from <mac@mcrowe.com>)
	id 1mDrXK-0003pb-Oe; Wed, 11 Aug 2021 17:57:02 +0100
Date: Wed, 11 Aug 2021 17:57:02 +0100
From: "Mike Crowe" <yocto@mac.mcrowe.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Ross Burton <ross@burtonini.com>,
	"Zhang, Qiang" <qiang.zhang@windriver.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core] [PATCH] python3: use monotonic clock for condvar if possible
Message-ID: <20210811165702.GA14091@mcrowe.com>
References: <20210803051138.30790-1-qiang.zhang@windriver.com>
 <CAAnfSTtD=Vz-3SY0UYBh62en9Z_WMzWP7iRQPynmJPmCR+PiHQ@mail.gmail.com>
 <CANNYZj9y7qXt92w0hfkWJufJ=7i6m8ddDcNfNzOJCUw+Ci_a+Q@mail.gmail.com>
 <20210811161449.GA7254@mcrowe.com>
 <CANNYZj-am4poZ6hahsUw5R3He8hny5EP7CLXRQSLXRP2TCVR-w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANNYZj-am4poZ6hahsUw5R3He8hny5EP7CLXRQSLXRP2TCVR-w@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Envelope: MS4wfLEnptxVfQm7LCDhpB9lhOeQOzEqbVq3eeVA1xzKoR9IaYV3IusRoCiHO7RuYzvWbDt61m/BKPAKW+3MtgoMyzBRVZPol12msS7msjjt7S2j2iQIKR8R
 JkRKWB9kM0jk+yMAzmum0byxfJfzadu/yBR6pTDnDRgI1JsO2KfZJPS7sUrk3hbwx1sQfiNKa+Sobg==
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wednesday 11 August 2021 at 18:32:31 +0200, Alexander Kanavin wrote:
> On Wed, 11 Aug 2021 at 18:14, Mike Crowe <mac@mcrowe.com> wrote:
> > I agree regarding the lack of explanation. However, even if the problem is
> > real (which it looks like it is based on
> > https://bugs.python.org/issue41710)
> > then it wouldn't be expected to cause test failures unless the system clock
> > was being warped at inconvenient times during the tests.
>
> So can we just patch python to use the right glibc function with the right
> clock type, and send the patch upstream then? Much better than the
> workaround that was merged.

In theory, yes. I've no idea how hard that is though. It probably requires
adding build-time detection of whether the new functions are available to
avoid breaking other/older target operating systems.

Mike.
