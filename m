Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 1F9A671A66
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 16:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id DD2FB31C21AF;
	Tue,  6 Dec 2016 17:37:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id BBC1zZGURmpF; Tue,  6 Dec 2016 17:37:56 +0100 (CET)
Received: from [172.22.22.61] (55d40c51.access.ecotel.net [85.212.12.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 72C5A31C21B5;
	Tue,  6 Dec 2016 17:37:56 +0100 (CET)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1481024991-5882-1-git-send-email-obi@opendreambox.org>
	<1481024991-5882-4-git-send-email-obi@opendreambox.org>
	<CAJTo0LbCWZYmnaxDjKNr==nNvyXn0Y3nXnJanoQb5ccgZpWxpg@mail.gmail.com>
	<eab1dd56-d37f-6e3d-f8f3-f5cfa1f99a52@opendreambox.org>
	<CAJTo0LZJ8J4RGY+MEes6+9A7_kygoyR4b0kXrj+6NS=jxzdTtA@mail.gmail.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <f71fad47-fad7-89f8-7b19-24840f4ff65f@opendreambox.org>
Date: Tue, 6 Dec 2016 17:37:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZJ8J4RGY+MEes6+9A7_kygoyR4b0kXrj+6NS=jxzdTtA@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 03/33] dpkg-native: hardcode SYSCONFDIR to /etc in update-alternatives
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
X-List-Received-Date: Tue, 06 Dec 2016 16:37:58 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 06.12.2016 17:12, Burton, Ross wrote:
> 
> On 6 December 2016 at 16:08, Andreas Oberritter <obi@opendreambox.org
> <mailto:obi@opendreambox.org>> wrote:
> 
>     I guess ${sysconfdir_native} should work, unless someone overrides
>     STAGING_ETCDIR_NATIVE. Would this be ok?
> 
> 
> If the recipe inherits native then the class reassigns:
> 
> sysconfdir = "${STAGING_ETCDIR_NATIVE}"
> 
> So you'll need to take sysconfdir, and strip off the staging directory.

I was asking because the result after stripping would essentially equal
${sysconfdir_native}:

STAGING_ETCDIR_NATIVE = "${STAGING_DIR_NATIVE}${sysconfdir_native}"

It wouldn't work if someone set it to "${STAGING_DIR_NATIVE}/foo"
without adjusting sysconfdir_native, but on the other hand someone could
just as well use "/path-outside-staging-dir-native/etc", which would
break attempts to strip the prefix, too. I'd guess the assumption that
STAGING_ETCDIR_NATIVE doesn't get changed alone should be safe.

Regards,
Andreas


