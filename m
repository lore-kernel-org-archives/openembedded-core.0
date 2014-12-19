Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id CEB3A72914
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Dec 2014 12:25:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBJCOUPk011816; Fri, 19 Dec 2014 12:24:30 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 3_rSTUtDbzlT; Fri, 19 Dec 2014 12:24:30 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBJCOGlA011783
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Fri, 19 Dec 2014 12:24:27 GMT
Message-ID: <1418991892.13316.12.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Date: Fri, 19 Dec 2014 12:24:52 +0000
In-Reply-To: <ly7fxnon55.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <cover.1418207154.git.bruce.ashfield@windriver.com>
	<0247524f2f7ae076fdac8773c3baa0794e5697dd.1418207154.git.bruce.ashfield@windriver.com>
	<lyegrv99wr.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<1418989891.13316.10.camel@linuxfoundation.org>
	<ly7fxnon55.fsf@ensc-virt.intern.sigma-chemnitz.de>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/7] kernel: fix out of tree module builds
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
X-List-Received-Date: Fri, 19 Dec 2014 12:25:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-12-19 at 13:11 +0100, Enrico Scholz wrote:
> Richard Purdie <richard.purdie@linuxfoundation.org> writes:
> > to the point of not being a currently well supported use case and the
> > classes would probably need to be refactored to allow such things to
> > be well supported. These changes do bring significant benefit
> 
> Does some lowered i/o really provide such a benefit?  With the new
> system you are bypassing the excellent staging system (which would
> detect e g ".config" or "System.map" file conflicts). Afais, it breaks
> with "rm_work" too (I guess, kernel:fetch stamp is removed when kernel
> build finishes and packages which inherit "kernelsrc" fetch the kernel
> sources (without .config and System.map) again).

In summary, basically, yes. The kernel source is huge and we were
compressing/decompressing it in several places on the critical path.
People were struggling to develop kernels using the system due to the
overhead.

Whilst this approach does bypass some parts of the system, I do believe
the benefits are worth it. We're talking about making the kernel build
time about three times faster iirc, and reducing its sstate footprint
significantly.

Cheers,

Richard


