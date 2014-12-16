Return-Path: <sledz@dresearch-fe.de>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by mail.openembedded.org (Postfix) with ESMTP id E4A7A72564
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Dec 2014 08:36:26 +0000 (UTC)
Received: by mail-wi0-f176.google.com with SMTP id ex7so11405286wid.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Dec 2014 00:36:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=vOr7ValLt2bhxlC9m854sSyKgofNDLmCE+y+1fgQWLo=;
	b=LGYS5zPNEaRC+VF0kEMgFTBrmJtR144xpDZ3hJIzl6YFJQAzIUVTKDrU8fsXajBvxE
	Ig/cmzw1QmxcJI/iLSbvH0IiAbh/jxWQiJS5/UzqXOl9WtYA+5MF0ut7L5Zg6OyfuyWF
	N5eGDWz8SFC/NZlkq0vNQcQz7kDvzrmbggqUDwCcs/JOeSQXwTYxyUaHMrP5agRHD9Ik
	s2N3s2gbpShG43Nircc3q5bOBvrKug7mDq7wKjtCIa/eQJC4vs+cXI+mj3HNexM1U1NE
	RaDboXofLbZBIdS0mWQVXKxUMd7A7DHB2oKOykSQVVKCu7ruBOZyZkrBXqabIPEf24lU
	5iog==
X-Gm-Message-State: ALoCoQkaGsrUYLsBwhpbYwqziGrEzCgl6D5QT9VHO+hOgaq1QMdvEr/i7PZcs4LqsRKnwqm74zE4
X-Received: by 10.194.216.170 with SMTP id or10mr59798160wjc.96.1418718986813; 
	Tue, 16 Dec 2014 00:36:26 -0800 (PST)
Received: from mobil-400-586.internal.dresearch-fe.de (zk223.dresearch-fe.de.
	[217.92.177.116])
	by mx.google.com with ESMTPSA id bj3sm16077512wib.3.2014.12.16.00.36.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Dec 2014 00:36:26 -0800 (PST)
Message-ID: <548FEF09.80304@dresearch-fe.de>
Date: Tue, 16 Dec 2014 09:36:25 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
References: <548EBDE0.3080704@dresearch-fe.de>
	<lyiohcubq7.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lyiohcubq7.fsf@ensc-virt.intern.sigma-chemnitz.de>
Subject: Re: "qemu-arm udevadm hwdb --update" eats swap space after build host update to openSUSE 13.2
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
X-List-Received-Date: Tue, 16 Dec 2014 08:36:36 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 15.12.2014 17:19, Enrico Scholz wrote:
> Steffen Sledz <sledz-mQBY8sqGERgRVMum7q6B+Q@public.gmane.org> writes:
> 
>> The first thing we observed was that the do_rootfs stage made a very
>> big load (more than 500) on the machine but the cpu's aren't working
>> for 100%. I could track down the problem to the call
>> ...
>> which eats swap space without end till the system crashes (more than 100GB swap space ist available).
>>
>> I've no idea how to inspect this problem further. Any ideas?
> 
> I had a similar issue when /var/tmp in the rootfs was an absolute symlink
> pointing to toplevel /var/tmp which contained some millions of files.
> 
> Can you look (lsof) which files are open by qemu?

Crazy! This really seems to be the problem.

I had a big subtree from earlier local openSUSE Build Service runs below toplevel /var/run. After deleting this the build succeeds.

But manually deleting such files before running OE builds cannot really be a reasonable solution. :(

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058

