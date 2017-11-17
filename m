Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 3B68678744
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 17:03:01 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id B0BC55C1939;
	Fri, 17 Nov 2017 17:57:39 +0100 (CET)
MIME-Version: 1.0
Date: Fri, 17 Nov 2017 17:58:38 +0100
From: Stefan Agner <stefan@agner.ch>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
In-Reply-To: <0658eacf-cf19-fd5b-6518-65e3f3f349e4@linux.intel.com>
References: <a316ea0c483e68f37d624e742472d248@agner.ch>
	<da5f7d07-f51c-e1f4-56dd-78e4febe9da7@linux.intel.com>
	<a4fcab328359fd5906f90c75d3d8cef0@agner.ch>
	<0658eacf-cf19-fd5b-6518-65e3f3f349e4@linux.intel.com>
Message-ID: <0573397f4480fdde492e1b5dba0d159f@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.2.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1510937859; bh=FNs+kLLIWK/hy/yuLnTrDgfdIRtJebu2ab0dPPWZJaw=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
	b=EoHUG7Uxf+IXi8gtMTlbQ8iF0L7gR6nSxf9X9g66p4flcZlqUme75J4tVisMirbb0E9dzK80wRQ5hr8+wAG8wvbSB5NS3wNWbs9dsCuXk6rqTXFR7GNXD0EcWloQFP5uZXz/MyWba7mTr96vPy2lhXRgYU80kAZSdwlI+oBM7KM=
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Error when connecting to OpenSSH server using rocko
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
X-List-Received-Date: Fri, 17 Nov 2017 17:03:02 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2017-11-16 16:06, Alexander Kanavin wrote:
> On 11/16/2017 04:51 PM, Stefan Agner wrote:
>> True, I cannot reproduce using qemuarm, but I created a ARMv7 qemu
>> machine and run that using qemu-system-arm -M virt -cpu cortex-a15, and
>> it did fail...
>>
>> So yeah qemuarm is not affected, but pretty much every relevant 32-bit
>> ARM machine out there...
> 
> openssl recipes have an architecture-specific configuration step where
> you need to specify the target machine by hand. I strongly *suspect*
> we do something incorrectly there in the 1.0 recipe for ARM machines.
> 
> I couldn't stand looking at that mess when writing 1.1, so rewrote the
> whole recipe from scratch, and it *probably* works correctly on ARM :)

Found the issue. It seems that binutils 2.29 broke OpenSSL 1.0.2 and
1.1.0. It only really showed for 1.0.2 in my case, but I guess this was
by chance...

https://github.com/openssl/openssl/issues/4659

Will send out patches.

--
Stefan

