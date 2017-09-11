Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [193.158.56.148])
	by mail.openembedded.org (Postfix) with ESMTP id 09EC178229
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 14:04:50 +0000 (UTC)
Received: from mail-mta-0.intern.sigma-chemnitz.de
	(mail-mta-0.intern.sigma-chemnitz.de [192.168.12.76])
	by mailout-1.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v8BE4nlE016571
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK) for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Sep 2017 16:04:50 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1505138690;
	bh=8/fOTTATZDcIZ63fBFgjcqe94CBPdkafT7kgy+tuaZk=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=ca0aDhzjf66lGuELnrPZiZaYYH4Nwl+/n+DWp1Vq7x5y3uGc4UDq9yMR+iH7NXO75
	t9XHNgzA1V+3oGh7V5qOLjMWh2LtxrPuzNCS3v7z2TSQYrwzs36yhVyGUmd7PSQkF3
	L4swtlxhdCYwYeAz3BIaaS9TR529BhYRv3kzD8KY=
Received: from reddoxx.intern.sigma-chemnitz.de
	(reddoxx.intern.sigma-chemnitz.de [192.168.0.193])
	by mail-mta-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v8BE4gLs029777 for <openembedded-core@lists.openembedded.org> from
	enrico.scholz@sigma-chemnitz.de; Mon, 11 Sep 2017 16:04:42 +0200
Received: from mail-msa-0.intern.sigma-chemnitz.de ( [192.168.12.77]) by
	reddoxx.intern.sigma-chemnitz.de
	(Reddoxx engine) with SMTP id 18267CE410B;
	Mon, 11 Sep 2017 15:59:40 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail-msa-0.intern.sigma-chemnitz.de (8.14.7/8.14.7) with ESMTP id
	v8BE4eoA029771
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 11 Sep 2017 16:04:40 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.87) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1drPKK-0001ho-Ck; Mon, 11 Sep 2017 16:04:40 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: Ed Bartosh <ed.bartosh@linux.intel.com>
References: <20170908173303.29634-1-enrico.scholz@sigma-chemnitz.de>
	<20170908173303.29634-4-enrico.scholz@sigma-chemnitz.de>
	<20170911134150.6jpsypaj4dgjv67t@linux.intel.com>
Date: Mon, 11 Sep 2017 16:04:40 +0200
In-Reply-To: <20170911134150.6jpsypaj4dgjv67t@linux.intel.com> (Ed Bartosh's
	message of "Mon, 11 Sep 2017 16:41:50 +0300")
Message-ID: <lyzia1fi13.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.2 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 0.76
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
X-List-Received-Date: Mon, 11 Sep 2017 14:04:52 -0000
Content-Type: text/plain

Ed Bartosh <ed.bartosh@linux.intel.com> writes:

>> The --extra-space and --overhead option did not had an effect to squashfs
>> partitions.  Although squashfs is read-only, it can be useful to allocate
>> more space for the on-disk partition to avoid repartitioning of the whole
>> disk when a new (and larger) squashfs image is written on later updates.
>
> Is it possible to just use --size or --fixed-size in .wks to allocate
> partition of certain size?

--fixed-size works with this patch (tested); --size should work.


>> +    def __extend_rootfs_image(self, rootfs):
>
> Do we really need to mangle name of this method?

ok; I will make it _extend_rootfs_image


> As this function is not going to be used anywhere I'd just use this
> code in prepare_rootfs_squashfs. It would be less generic, but much
> more readable and understandable.

I would keep it as is.  It is a non trivial function which is reusable.
Perhaps, somebody adds CRAMFS or another file system which does not
support extending its size.

partition.py is full of redundant code (look for all the "du" calls or
generally at the beginning of the prepare_rootfs_*() methods) where
probably somebody thought that it is not going to be used anywhere else
;)


Enrico

