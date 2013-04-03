Received: from mail-ve0-f173.google.com ([209.85.128.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UNOkZ-00071i-PB
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 16:33:19 +0200
Received: by mail-ve0-f173.google.com with SMTP id cy12so1708452veb.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2013 07:16:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=OEq9cur/bEgeY4jeqDwIJ4+XAkJz6leHNWvI4jsulqo=;
	b=MwKKE0GkhGmJyHxjHicChMVrM41rUFaO4q4Jk2NOrZ4gecWY7hYPGNf2v1b9szYI0u
	vOQSM0c68NBzDcf6oJr45Hssg2MQS8wFJ1cEYLu8frXKPs2lQoK2lRPml7K0z64KdS7r
	/uHxha830Pqy15PnqOvYXjoRcZP4QbJVuVbzO0SFWzCZLJL1g5WAZm8IJ5xRqKD+MntO
	sntshPYkOJb/mKH2aZEEtUlOEDolJ1/ceqIpJly77d5ioP/JYzcWrqZJhJs+hZudg/cC
	yoxLRqvBR5K64gqQFCyeXC5vT7jMnGevcON+EYHhqncZiT5vJogHOPm7um0Zg5MMD8pB
	8vuQ==
X-Received: by 10.52.91.39 with SMTP id cb7mr1135127vdb.71.1364998568112; Wed,
	03 Apr 2013 07:16:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.134.74 with HTTP; Wed, 3 Apr 2013 07:15:48 -0700 (PDT)
In-Reply-To: <CAGiJk9fdtf5-WVYLeS249YbV04AfOuQ4-8j0A7m5DY9NdvP=GQ@mail.gmail.com>
References: <1364907243-26346-1-git-send-email-radu.moisan@intel.com>
	<CAGiJk9chnOh7F9koDo2kEP5rjJ97kZ9bL6uEKkWYegS9g4AUnw@mail.gmail.com>
	<515ADEA3.5030800@intel.com>
	<CAGiJk9fdtf5-WVYLeS249YbV04AfOuQ4-8j0A7m5DY9NdvP=GQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Apr 2013 15:15:48 +0100
Message-ID: <CAJTo0LZ9b3yqJ+K1Y03aC3OXhpsaB40D5PXfENqh2oe1ybErZg@mail.gmail.com>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
X-Gm-Message-State: ALoCoQk3xYjKx3PCricv33wFpBfeup/vmFRY6b3obgn/kHP4q9kYRcTh+PjuVgmhew8RLJTU75kt
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4] systemd: set default.target to multi-user.target
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Apr 2013 14:33:19 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

On 2 April 2013 15:15, Samuel Stirtzel <s.stirtzel@googlemail.com> wrote:
>>>> For xserver-nodm-init we would then have something like:
>>>> inherit update-alternatives
>>>> ALTERNATIVE_${PN} = "systemd-def-target"
>>>> ALTERNATIVE_TARGET[systemd-def-target] =
>>>> "${systemd_unitdir}/system/graphical.target"
>>>> ALTERNATIVE_LINK_NAME[systemd-def-target] =
>>>> "${systemd_unitdir}/system/default.target"
>>>> ALTERNATIVE_PRIORITY[systemd-def-target] ?= "10"
>>>>
>>>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>

This really needs to be a series of two patches, with this change
implemented too.

> To comment on this change:
> A developer would expect that a system (hardware or software) behaves
> in a specific matter (the default behavior).
> By changing the default, the system behavior is undefined (as the
> default behavior was changed).

The behaviour is not undefined, it's perfectly clear - the default
target is multi-user unless changed, and by patching the X startup
recipes in oe-core and meta-oe we handle the majority of cases.

> As alternative of changing the default I would propose that a
> specialization overrides this symlink where needed, and the
> generalization stays unchanged (like OOP inheritance).
> Therefore a specialization would be image configurations or
> postinstall appends for images that have no need for the graphical
> user target.

How would you implement this?  Register the alternative in systemd.bb
defaulting to graphical, and then switch it in every image recipe in
oe-core/meta-oe/etc that doesn't use an X or Wayland (patches coming
shortly) session?

The bigger question to me is how to handle the alternative in a way
that doesn't create the symlink if we're not using systemd.

Ross


