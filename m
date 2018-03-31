Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 0CBE77459C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 31 Mar 2018 13:12:59 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w2VDCtTK005093
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sat, 31 Mar 2018 14:12:57 +0100
Message-ID: <1522501975.11431.208.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Seebs <seebs@seebs.net>, Andre McCurdy <armccurdy@gmail.com>
Date: Sat, 31 Mar 2018 14:12:55 +0100
In-Reply-To: <20180331000631.5f050451@seebsdell>
References: <20180327154802.14611-1-ross.burton@intel.com>
	<CAJ86T=WCAKWoQhxM+2ako7cYJH2RieuGyuLMXcmjNETBidbsaA@mail.gmail.com>
	<CAJTo0LZUdMAtWKtGnPstotRGiHUPwZ_80PmuSzj5wpAFWGcN0Q@mail.gmail.com>
	<CAJ86T=WcgEo8SFRLPeRXyFXU-tRwXn0bXdYjiV4D9G19BOWuDg@mail.gmail.com>
	<20180331000631.5f050451@seebsdell>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][RFC] pseudo: intercept syscall() and return ENOTSUP for renameat2
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
X-List-Received-Date: Sat, 31 Mar 2018 13:13:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Just to report back, I've tried testing an earlier version of pseudo
master with the path changes reverted and current master. With both I'm
seeing librsvg fail during do_install with a segfault (you have to
remove the 2> /dev/null to see it).

I'm seeing multiple entries in the host's dmesg:

[180364.269879] glib-compile-re[38258]: segfault at 0 ip           (null) sp 00007ffffaafbf78 error 14 in glib-compile-resources[55abc201b000+9000]
[180376.499904] glib-compile-re[46860]: segfault at 0 ip           (null) sp 00007ffd3b10f2c8 error 14 in glib-compile-resources[55b2cb528000+9000]
[180376.612404] glib-compile-re[46862]: segfault at 0 ip           (null) sp 00007fff612977f8 error 14 in glib-compile-resources[55ad08797000+9000]
[180376.726317] glib-compile-re[46864]: segfault at 0 ip           (null) sp 00007ffdce018928 error 14 in glib-compile-resources[5610851ec000+9000]
[180376.836705] glib-compile-re[46866]: segfault at 0 ip           (null) sp 00007ffc586fdda8 error 14 in glib-compile-resources[562f38dfc000+9000]
[180603.294668] gdk-pixbuf-quer[51620]: segfault at 0 ip           (null) sp 00007ffce7947fe8 error 14 in gdk-pixbuf-query-loaders.real[55b88bb7f000+2000]
[185206.227285] gdk-pixbuf-quer[51885]: segfault at 0 ip           (null) sp 00007ffe6393ae28 error 14 in gdk-pixbuf-query-loaders.real[556db9ae3000+2000]
[186523.735264] gdk-pixbuf-quer[70272]: segfault at 0 ip           (null) sp 00007fff6a855808 error 14 in gdk-pixbuf-query-loaders.real[55ec4e8fd000+2000]

I believe that libglib-2.0 does use syscall() for something and that
the above programs are calling into it and faulting.

Its likely possible to reproduce this outside of a build by running
make install from librsvg under pseudo.

If I take master and revert 778abd3686fb7c419e9016fdd9e93819405d52aa fr
om pseudo, it no longer segfaults.

So something is not working correctly with the intercept sadly.

Cheers,

Richard

