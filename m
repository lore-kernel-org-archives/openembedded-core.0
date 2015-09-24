Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 905EA76FF6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 06:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8O6ZYTx001117; Thu, 24 Sep 2015 07:35:34 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id dbV7y-ozChJ4; Thu, 24 Sep 2015 07:35:34 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t8O6ZIR5001109
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Thu, 24 Sep 2015 07:35:30 +0100
Message-ID: <1443076518.19044.50.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Gary Thomas <gary@mlbassoc.com>
Date: Thu, 24 Sep 2015 07:35:18 +0100
In-Reply-To: <56032DC0.80004@mlbassoc.com>
References: <1443047565.19044.44.camel@linuxfoundation.org>
	<56032DC0.80004@mlbassoc.com>
X-Mailer: Evolution 3.12.11-0ubuntu3 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gdk-pixbuf: Avoid rebuild failures
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
X-List-Received-Date: Thu, 24 Sep 2015 06:35:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-09-23 at 16:54 -0600, Gary Thomas wrote:
> On 2015-09-23 16:32, Richard Purdie wrote:
> > If gdkpixbuf-native rebuilds and there are stale (broken) modules lying around,
> > it can fail to run the postinst. E.g. svg links to harfbuzz and if harfbuzz is
> > removed from the sysroot but the svg loader isn't, we get a symbol linking issue.
> >
> > The reproducer is along the lines of build gdk-pixbuf-native along
> > with harfbuzz-native and librsvg-native, then make a small change to the
> > gdk-pixbuf recipe that would cause it to rebuild, clean harfbuzz-native
> > and then build gdk-pixbuf.
> >
> > To fix this, when we install gdk-pixbuf, we wipe out any previous loaders.
> > The idea is that gdk would always come first and anything else installing
> > itself will come later and rerun the postinst if needed. We can therefore
> > just remove any other loaders.
> 
> Does the analogue of this problem exist for the non-native packages?  I've
> not seen it, but it seems that it might based on your analysis.

No, since we only have the postinst to index the loaders in the native
case. In the target case we do that at rootfs time (or on target). So
this is a native only issue.

Cheers,

Richard


