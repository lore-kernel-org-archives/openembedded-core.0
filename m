Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 38FE3700F3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Aug 2017 11:02:38 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v7EB2Ypw028970
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Mon, 14 Aug 2017 12:02:35 +0100
Message-ID: <1502708554.13978.7.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 14 Aug 2017 12:02:34 +0100
In-Reply-To: <CAHiDW_GXRzkW14wT1o_v27WS1m72+bW5U55yZWjMSm2wKX4uNA@mail.gmail.com>
References: <CAHiDW_EycsMUfCykDicgHuVzykCT0YYQHE9EY8i6yFqJsbbSJQ@mail.gmail.com>
	<1502707098.13978.3.camel@linuxfoundation.org>
	<CAHiDW_GXRzkW14wT1o_v27WS1m72+bW5U55yZWjMSm2wKX4uNA@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Mon, 14 Aug 2017 12:02:35 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: native sysroot race with rpmbuild
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
X-List-Received-Date: Mon, 14 Aug 2017 11:02:39 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-08-14 at 13:55 +0300, Jussi Kukkonen wrote:
> Adwaita I had lost already but I've put the logs for failing
> packagegroup-core-x11-sato here:
> https://github.com/jku/packagegroup-core-x11-sato-logs
>  
> There's this in the log:
> | NOTE: rpm-native exists in sysroot, skipping

What is really interesting is:

https://github.com/jku/packagegroup-core-x11-sato-logs/blob/master/log.do_package_qa.28854

which looks to have been running about the same time as:

https://github.com/jku/packagegroup-core-x11-sato-logs/blob/master/log.do_package_write_rpm.28850

(similar pids and listed in https://github.com/jku/packagegroup-core-x11-sato-logs/blob/master/log.task_order after one another)

Note that package_qa seems to think the dependency disappeared and is
uninstalling elfutils (which provides libdw) from the sysroot.

That might be enough to figure out some kind of reproducer. All very
interesting and "potentially problematic"...

Cheers,

Richard

