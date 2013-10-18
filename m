Return-Path: <enrico.scholz@sigma-chemnitz.de>
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mail.openembedded.org (Postfix) with ESMTP id 66B1D6CE9E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 12:48:06 +0000 (UTC)
Received: from mail.cvg.de (mail.cvg.de [62.153.82.30])
	by mailout-1.intern.sigma-chemnitz.de (8.14.4/8.14.4) with ESMTP id
	r9ICm5lE021281
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 14:48:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sigma-chemnitz.de;
	s=v2012061000; t=1382100486;
	bh=OnkPzo81NrdsC9juQ2TnzllQI++XBhB/qACQj2CMqVY=;
	h=From:To:Subject:References:Date:In-Reply-To:Message-ID:
	MIME-Version:Content-Type:Sender;
	b=UIoDysMblkjq5W48amswDXBc3sjl0i4ko7jWcMmqwKgCaXAr8UkX+GB5wDrrOTi4J
	P9VN33p8+APIBNy9/HY6QO9GVnyJ+lDNc3cKyo1+M+nTRR5QS4UvT0292ZSCQG//vS
	96jTXfxLVIpda0HkPeKG07AB1fDDeh/5g5ktP8Xk=
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.4/8.14.4) with ESMTP id r9IClvos011697
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 14:47:58 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.80.1) (envelope-from <ensc@sigma-chemnitz.de>) id 1VX9TB-0002VE-Fa
	for openembedded-core@lists.openembedded.org;
	Fri, 18 Oct 2013 14:47:57 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-core@lists.openembedded.org
References: <1382083973-13444-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LZBVxwoUufz4dbpaCXoV4x3x+S_q3NYowGsjstXHDs=tQ@mail.gmail.com>
Mail-Followup-To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Fri, 18 Oct 2013 14:47:57 +0200
In-Reply-To: <CAJTo0LZBVxwoUufz4dbpaCXoV4x3x+S_q3NYowGsjstXHDs=tQ@mail.gmail.com>
	(Ross Burton's message of "Fri, 18 Oct 2013 12:17:22 +0100")
Message-ID: <ly7gdawxs2.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-DSPAM-Result: Innocent
X-DSPAM-Probability: 0
X-DSPAM-Confidence: 1
X-Spam-Score: -4.2
X-Spam-Level: ----
X-Spam-Tests: AWL,DKIM_ADSP_ALL,RP_MATCHES_RCVD,SPF_NEUTRAL,DSPAM_INNOCENT
X-Scanned-By: MIMEDefang 2.74
Subject: Re: [PATCH v4] connman: ignore the networking device which nfs for rootfs is working on
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
X-List-Received-Date: Fri, 18 Oct 2013 12:48:07 -0000
Content-Type: text/plain

"Burton, Ross" <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
writes:

> Can you explain why connman needs to ignore the device that NFS is
> reading the rootfs from?  I ask because the very latest connman
> release shouldn't be dropping and re-configuring interfaces if there's
> a provisioned configuration for them (see connman-conf, which does
> this for all qemu machines) and that configuration matches the current
> configuration.  Would this be sufficient for the rootfs-on-NFS
> situation?

not really... the provisioning stuff does not seem to work for the
'ip=dhcp' case.

I know that this case is not handled well with this patch either (it
misses renewal of dhcp leases, setup of dns + ntp).  But it is still
better than actual behavior.

On first glance, the do-not-cleanup patch in connman seems to cover
system startup only.  I might miss something, but afais, interface will
be still shut down in the middle of reboot which is bad because '/' is
needed nearly to the end of shutdown.



Enrico

