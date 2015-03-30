Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 01975736B6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Mar 2015 20:28:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2UKS4wj031302; Mon, 30 Mar 2015 21:28:04 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id HZ_Xao8Et4NN; Mon, 30 Mar 2015 21:28:04 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t2UKRm3g031298
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 30 Mar 2015 21:28:00 +0100
Message-ID: <1427747268.14020.326.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Bryan Evenson <bevenson@melinkcorp.com>
Date: Mon, 30 Mar 2015 21:27:48 +0100
In-Reply-To: <BN3PR0501MB1090B5CDC1B3FF89CCC4D286BBF50@BN3PR0501MB1090.namprd05.prod.outlook.com>
References: <BN3PR0501MB1090B5CDC1B3FF89CCC4D286BBF50@BN3PR0501MB1090.namprd05.prod.outlook.com>
X-Mailer: Evolution 3.12.10-0ubuntu1~14.10.1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Verification on how TARGET_CFLAGS is set
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
X-List-Received-Date: Mon, 30 Mar 2015 20:28:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-03-30 at 13:09 +0000, Bryan Evenson wrote:
> I am about to upgrade to the dizzy branch.  I have a built a bootable
> image on my test build machine, and now I'm going to be applying
> changes to the system I use for building production images.  I'm
> planning on deleting my tmp directory to force a re-build of
> everything.  Since I'm rebuilding everything anyway, I'm taking a
> deeper look at the CFLAGS related settings and I'm getting a little
> lost in the logic.  I'd like to verify these settings before I start
> rebuilding everything.
> 
> If I'm following the default logic correctly in bitbake.conf, by
> default TARGET_CFLAGS will be set to "-O2 -pipe -g
> -feliminate-unused-debug-types".  I want the default TARGET_CFLAGS for
> my production image to be "-O2 -pipe".  What's the suggested variable
> to change, and where, to get this final value?  Do I set TARGET_CFLAGS
> directly, or do I set SELECTED_OPTIMIZATIONS or even
> FULL_OPTIMIZATIONS?  Do I set it in local.conf or should I be setting
> it somewhere else?

If I remember rightly, you need the -g option there to generate the -dbg
packages correctly. The target system binaries won't change since we
separate out the debug data into separate files as part of the packaging
process.

You therefore can gain some build performance from turning that off but
your runtime won't alter much (other than the debuglink ID which is a
few bytes).

Cheers,

Richard


