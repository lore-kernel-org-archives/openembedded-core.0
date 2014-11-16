Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 013D7712A7
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Nov 2014 12:59:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sAGCwhYR009982; Sun, 16 Nov 2014 12:58:43 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 0HKYKrgbWelM; Sun, 16 Nov 2014 12:58:43 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sAGCwTsN009969
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 16 Nov 2014 12:58:40 GMT
Message-ID: <1416142745.28563.2.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Peter A. Bigot" <pab@pabigot.com>
Date: Sun, 16 Nov 2014 12:59:05 +0000
In-Reply-To: <5467EA52.6020008@pabigot.com>
References: <54677D77.2090104@pabigot.com> <5467EA52.6020008@pabigot.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: opkg/rpm inconsistencies in multilib image installations
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
X-List-Received-Date: Sun, 16 Nov 2014 12:59:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2014-11-15 at 18:05 -0600, Peter A. Bigot wrote:
> On 11/15/2014 10:21 AM, Peter A. Bigot wrote:
> > tl;dr: multilib apparently defines its own root directory underneath 
> > ${IMAGE_ROOT} which includes copies of /etc files like passwd that are 
> > not known to pseudo.  opkg and rpm differ in whether useradd scripts 
> > are run when a multilib package is installed, resulting in failures to 
> > add users/groups during multilib install when using opkg because a 
> > sanity check thinks they already exist because pseudo is looking 
> > somewhere else.
> 
> Actually, I'm going to retract this whole thing, since I'm now unable to 
> reproduce any of the problems described here.  Possibly because of 
> changes to the pseudo patches that fixed problems I thought were 
> unrelated to this behavior.
> 
> Sorry for the noise.

FWIW you are right in that the way multilib works with rpm is different
to ipk/deb, you can end up with two different rootfs directories which
are then reconciled. I do have some concerns about what would happen to
the passwd/group files in this scenario since they could easily become
out of sync. I suspect we'd have to create a pathological configuration
to manage that but its probably possible. I *think* the system would at
least error out if that pathological case occured.

That said, I suspect this problem exists before your patchset so isn't a
new issue.

Cheers,

Richard


