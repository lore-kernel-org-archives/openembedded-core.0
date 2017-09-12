Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id E77F1781AD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 09:44:11 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v8C9iBtB006074
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 11:44:12 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1505209452;
	bh=Y+ZxoIDhoPEj+qzYx6/qh7QO+T8XUWMDnoUFu1pvEwc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=e1TGxPieBvgiASLolg+4ehZ5/FTK5pq5iptkwXr419Mhy4+3P18TLTXkeivIU6wJ2
	RsytkJNQLAXicHV7Wi9yfAa44lOTeBLhyi0v+58EU8DVEihenknd0OQnl09Jl3cK6x
	JdGLx1RIrB7NjU6NfYo8tQhiV4mqggj2sDU/RRGw=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v8C9i4gR016473 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Tue, 12 Sep 2017 11:44:05 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 5C994A83222;
	Tue, 12 Sep 2017 11:39:01 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v8C9i2HX016470
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 12 Sep 2017 11:44:03 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.87) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1drhje-0005LY-Do; Tue, 12 Sep 2017 11:44:02 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
References: <20170908173303.29634-1-enrico.scholz@sigma-chemnitz.de>
	<20170908173303.29634-4-enrico.scholz@sigma-chemnitz.de>
	<20170911134150.6jpsypaj4dgjv67t@linux.intel.com>
	<lyzia1fi13.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20170912085301.rfsiwojqn2nr6md5@linux.intel.com>
Date: Tue, 12 Sep 2017 11:44:02 +0200
In-Reply-To: <20170912085301.rfsiwojqn2nr6md5@linux.intel.com> (Ed Bartosh's
	message of "Tue, 12 Sep 2017 11:53:01 +0300")
Message-ID: <lymv60fdzx.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.99
X-Spam-Score: -4.6
X-Spam-Level: ----
X-Spam-Tests: AWL, BAYES_00, DKIM_ADSP_ALL, RP_MATCHES_RCVD, SPF_NEUTRAL,
	DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.79
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] wic: apply --extra-space + --overhead to squashfs
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
X-List-Received-Date: Tue, 12 Sep 2017 09:44:13 -0000
Content-Type: text/plain

Ed Bartosh <ed.bartosh@linux.intel.com> writes:

>> >> The --extra-space and --overhead option did not had an effect to squashfs
>> >> partitions.  Although squashfs is read-only, it can be useful to allocate
>> >> more space for the on-disk partition to avoid repartitioning of the whole
>> >> disk when a new (and larger) squashfs image is written on later updates.
>> >
>> > Is it possible to just use --size or --fixed-size in .wks to allocate
>> > partition of certain size?
>> 
>> --fixed-size works with this patch (tested); --size should work.
>
> Sorry for not being clear. Why do we need this if we can use --size to
> explicity specify partition size?

--size and --fixed-size did not had an effect for squashfs with the old
code.


> --extra-space and --overhead have the same meaning as
> IMAGE_ROOTFS_EXTRA_SPACE and IMAGE_OVERHEAD_SIZE variables. From my
> point of view their purpose is to allocate additional space on the
> file system. This doesn't make sense for squashfs. That's the reason
> those options are not used for squashfs. Using them to implicitly make
> bigger partition is a questionable and possible confusing approach.

I want/need it to allow updates of the running system without complete
repartitioning.  E.g. at wic creation time, the squashfs has a certain
size.  Sometime in the future, there are needed e.g. 5 MiB more because
a new package was added or so.

I need to reserve space in the partition so that I can 'dd' the new
image without a complete repartitioning.

--extra-space/--overhead has the meaning which I want (e.g. to say
"reserve +20% for changes in the future").


>> I would keep it as is.  It is a non trivial function which is reusable.
>> Perhaps, somebody adds CRAMFS or another file system which does not
>> support extending its size.
>> 
>
> I personally find this much more understandable and logical:

me not ;) As I said, functionality is perfect for putting into an extra
method and it makes code much more readable.  When somebody implements
CRAMFS he can use this method instead of copy&pasting the code.


> Then introducing a method that will be called for all supported
> filesystems except squashfs without any effect.

You mean, function should be called at the end of prepare_rootfs()
(after "method(...)")?  Yes, it would reduce code duplication but other
methods needs to be touch too (to give information whether rootfs size
has been adjusted already).


Enrico
-- 
SIGMA Chemnitz GmbH       Registergericht:   Amtsgericht Chemnitz HRB 1750
Am Erlenwald 13           Geschaeftsfuehrer: Grit Freitag, Frank Pyritz
09128 Chemnitz

