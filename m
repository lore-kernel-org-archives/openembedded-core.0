Received: from mail-ob0-f176.google.com ([209.85.214.176])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1UNPIp-0001AS-Vz
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 17:08:44 +0200
Received: by mail-ob0-f176.google.com with SMTP id er7so1443257obc.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2013 07:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=VDaUjgHs3PnedzHpe1ZDKqzDrXUmLM/B4IkVXj6tupc=;
	b=IudUPV+lzRyFP9ldILSAZdF+0CYDt40ZcYZjSgqRn8l3vXgPkbv2Z7YzKmpY1v+uaq
	X8zN10xXkT5DxaG85vJdLxPq7UfZCnVd8sOE+skuOQAoFp3sqHm2x7I2ovTYqzNHumbp
	02YWwOPA7/6yk1Y1jwK1cSsJo3h0OhGWmyHkfyvDP2u7dYoCsPHQ+WDs1TibBgEiB9LM
	bo0i4pLUvgWUxwuekqhRVgz73atZMpX3fHeVyznQT15sfjahY/O+Dj5DQEAc+tPiHsYf
	oRIpp5UhhJO4FS5TwMGfwThe9EALDonmnLmWxciB5yLOqWfGAk6jdSoTbBB49zNMKPxi
	Y5Nw==
MIME-Version: 1.0
X-Received: by 10.182.72.5 with SMTP id z5mr1307532obu.24.1365000692141; Wed,
	03 Apr 2013 07:51:32 -0700 (PDT)
Received: by 10.60.46.69 with HTTP; Wed, 3 Apr 2013 07:51:31 -0700 (PDT)
In-Reply-To: <CAJTo0LZ9b3yqJ+K1Y03aC3OXhpsaB40D5PXfENqh2oe1ybErZg@mail.gmail.com>
References: <1364907243-26346-1-git-send-email-radu.moisan@intel.com>
	<CAGiJk9chnOh7F9koDo2kEP5rjJ97kZ9bL6uEKkWYegS9g4AUnw@mail.gmail.com>
	<515ADEA3.5030800@intel.com>
	<CAGiJk9fdtf5-WVYLeS249YbV04AfOuQ4-8j0A7m5DY9NdvP=GQ@mail.gmail.com>
	<CAJTo0LZ9b3yqJ+K1Y03aC3OXhpsaB40D5PXfENqh2oe1ybErZg@mail.gmail.com>
Date: Wed, 3 Apr 2013 16:51:31 +0200
Message-ID: <CAGiJk9fV0rSMJaiAHF+dAmqC2jZmUbVwGsovcaXBTFFPTu8K7A@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: "Burton, Ross" <ross.burton@intel.com>
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
X-List-Received-Date: Wed, 03 Apr 2013 15:08:44 -0000
Content-Type: text/plain; charset=UTF-8

2013/4/3 Burton, Ross <ross.burton@intel.com>:
> Hi,
>
> On 2 April 2013 15:15, Samuel Stirtzel <s.stirtzel@googlemail.com> wrote:
>>>>> For xserver-nodm-init we would then have something like:
>>>>> inherit update-alternatives
>>>>> ALTERNATIVE_${PN} = "systemd-def-target"
>>>>> ALTERNATIVE_TARGET[systemd-def-target] =
>>>>> "${systemd_unitdir}/system/graphical.target"
>>>>> ALTERNATIVE_LINK_NAME[systemd-def-target] =
>>>>> "${systemd_unitdir}/system/default.target"
>>>>> ALTERNATIVE_PRIORITY[systemd-def-target] ?= "10"
>>>>>
>>>>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>
> This really needs to be a series of two patches, with this change
> implemented too.
>
>> To comment on this change:
>> A developer would expect that a system (hardware or software) behaves
>> in a specific matter (the default behavior).
>> By changing the default, the system behavior is undefined (as the
>> default behavior was changed).
>
> The behaviour is not undefined, it's perfectly clear - the default
> target is multi-user unless changed, and by patching the X startup
> recipes in oe-core and meta-oe we handle the majority of cases.

When we decide that we handle standard behavior different than the
rest of the world, then this patch is basically a fork of systemd.
Also we tell every affected software developer:
"No your software won't work with OE-core / Yocto Project without
adaption, we are incompatible with the systemd standard to make life
more comfortable for (some of) us"


>> As alternative of changing the default I would propose that a
>> specialization overrides this symlink where needed, and the
>> generalization stays unchanged (like OOP inheritance).
>> Therefore a specialization would be image configurations or
>> postinstall appends for images that have no need for the graphical
>> user target.
>
> How would you implement this?  Register the alternative in systemd.bb
> defaulting to graphical, and then switch it in every image recipe in
> oe-core/meta-oe/etc that doesn't use an X or Wayland (patches coming
> shortly) session?

If this works why not?
It sounds like a good idea, because this way would not break anything,
and we would be compatible with the standard systemd.


>
> The bigger question to me is how to handle the alternative in a way
> that doesn't create the symlink if we're not using systemd.

I am not sure if this works, but couldn't the presence of systemd be
detected (e.g. in the image task list)?
Or alternatively the configuration of the [image|distro]-feature could
be checked (wherever systemd is usually set nowadays).


--
Regards
Samuel


