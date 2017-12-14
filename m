Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 89E0760043
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 13:16:48 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 71C9F5C36AF;
	Thu, 14 Dec 2017 14:10:46 +0100 (CET)
MIME-Version: 1.0
Date: Thu, 14 Dec 2017 14:11:52 +0100
From: Stefan Agner <stefan@agner.ch>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
In-Reply-To: <56bd3e44-1478-9095-4fef-3f7453b7ec94@linux.intel.com>
References: <20171213180624.30839-1-stefan@agner.ch>
	<cce87fc26f1e975fe9ee6d9321bbb870@agner.ch>
	<56bd3e44-1478-9095-4fef-3f7453b7ec94@linux.intel.com>
Message-ID: <a2a011e2de41685295946b44f13102f4@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.2.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1513257046; bh=30FJ/Whvdj4Z8kVVyVeqEbfXwxnZ0gDLAdTy71n5ojU=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
	b=yzTWuzLFIytLVMy6mdHljsMTVRNx5IpX1RXJ6SR9F0drSPxT7LQxOGrYyveSM7fKsYcKjaO7Ty3aw9lsKK7SgBLk9NSnnplgczcmyyQSxZgaEA+q0Qx2XQ8qYR/m7fTcriXK6JB+Rn4K0gZWPXriCs6Gfz05m1F22jAqKrgF47U=
Cc: muhammad_shakeel@mentor.com, Stefan Agner <stefan.agner@toradex.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [RFC] opkg: avoid running postinst scripts twice when using systemd
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
X-List-Received-Date: Thu, 14 Dec 2017 13:16:48 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2017-12-14 14:10, Alexander Kanavin wrote:
> On 12/13/2017 08:29 PM, Stefan Agner wrote:
> 
>> Maybe it needs something like this?
>>
>>
>>          runtime_pkgmanage = bb.utils.contains("IMAGE_FEATURES",
>> "package-management",
>>                                                True, False, self.d)
>>          if delayed_postinsts and not runtime_pkgmanage:
>>              self._save_postinsts()
>>              if image_rorfs:
>>                  bb.warn("There are post install scripts "
>>                          "in a read-only rootfs")
> 
> I don't think this is correct. Some postinsts are intentionally
> deferred to first boot, and they need to be run regardless of whether
> the image supports runtime package management or not.

Yes I know, the mentioned opkg-keyrings is such a case.

If there is no package management, then scripts get deployed via
/etc/*-postinsts, if package management is available then it will take
care of it.

--
Stefan

