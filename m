Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1SDk1V-0007v9-8O
	for openembedded-core@openembedded.org; Sat, 31 Mar 2012 00:10:21 +0200
Received: by qcso7 with SMTP id o7so636913qcs.6
	for <openembedded-core@openembedded.org>;
	Fri, 30 Mar 2012 15:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=Zi/tfl46xCFka2JidtVl+IY5yPM4esl+624eofqEdsU=;
	b=nZzkZgkuzdOa6kpA6F+im0UVKinxiz7lfejeY1RzwI3X+Pv68wrjG04NmNJsdWY36L
	ltDCIwxzRjei1xgEAHanWP+II5Pz8wFdZBhaNLccrXWjintn3NFAePRfS1dj5VfRcsnZ
	sOH0dEYfSGfbSFvPQWar3Vgt51smBnuSMp4NbpNi5vnIuF01DqyB+Xg7AXh/Pvpy1HY+
	NEw9Cyb37HegvOC4F2OhOW6B0bRogWUeXXlf3SxpzKhJ6BA61nvbV+9UwYC5NNlH5nH1
	wuF8mylso4YxF131+0QK0ge8hmitK7omKT46RU86r+kob5Nd/+emETu5jasAXXcqF0MY
	1UTw==
Received: by 10.224.182.201 with SMTP id cd9mr542832qab.92.1333144876048; Fri,
	30 Mar 2012 15:01:16 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.158.11 with HTTP; Fri, 30 Mar 2012 15:00:55 -0700 (PDT)
In-Reply-To: <CABcZANnPwgsCz=f8_UhM3TZsBotBZ26FYp5Fbxjq_kYqqBs3cQ@mail.gmail.com>
References: <CABcZANnPwgsCz=f8_UhM3TZsBotBZ26FYp5Fbxjq_kYqqBs3cQ@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 30 Mar 2012 15:00:55 -0700
X-Google-Sender-Auth: 6jXLvIeR3Aymzilh6VYdQYLk8Bg
Message-ID: <CABcZANmFh0XKGdOeuAFWam9op+7ELWCqXy47Jctdd+8MYgTfiw@mail.gmail.com>
To: openembedded-core@openembedded.org
Subject: Re: [RFC] One shared state reuse solution
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Mar 2012 22:10:21 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 30, 2012 at 2:54 PM, Chris Larson <clarson@kergoth.com> wrote:
> Over the past day, I've implemented a solution for the shared state
> reuse issues Mentor has seen with our poky-based product. This
> solution is similar in concept to what we had in our Mentor Embedded
> Linux 4 (non-yocto-based) product.
>
> This implementation restructures SSTATE_DIR such that non-target
> sstate archives are placed in a directory specific to the host we're
> running on, and allows fallback to sstates from compatible hosts. In
> addition, there is a hook in place for modifying the returned build
> host identifier string. Using these capabilities, configured as you'll
> see below at the gist, I can populate sstate-cache from a Centos5
> machine and fully reuse that shared state on a u1004 machine, but if I
> take the u1004 sstate-cache and pull it over to Centos5, all the
> non-target recipes will be rebuilt.

I forgot to mention, it allows fallback both within the SSTATE_DIR and
for mirrors in SSTATE_MIRRORS, as it iterates over each mirror and
adjusts the mirror uri to include each compatible host (including the
current one).
-- 
Christopher Larson


