Received: from mail-vc0-f177.google.com ([209.85.220.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TyNfU-0002oD-Jj
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 15:20:40 +0100
Received: by mail-vc0-f177.google.com with SMTP id m18so4200275vcm.22
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 06:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=/3HvFo1thGVogZAAD5/BsrpAkIDUc7H68s9+mTsVScA=;
	b=0fBOQS8VlfW6XYtJA3maEZPRvSjvTR4cRa+cqenq/FYU0++m4xBt6cs087SSUm+0i0
	jovW9Rarke/0BG5uZgTNcoY0D+CPJnW44pH1MepLzxquKRuG++5wqsllBPU+8nU2NZIv
	EQVtOUZL/Jo1vfEp4CFHB3yiG+REF3F+uSP5wUcA1MVNSk0R2qzyNBG2ocSxIHX+9jep
	BsyLQiTpacUmrW5JZmwRuW0sHTETsConmZpGP8LZlHoDSOlxuIzddu1D+2Q1kq6P1BlR
	wWspa4UvvJ8JVvtdboyhDa9nJJOG8boH8KILFDJI+xUN7JNbxhG7oG/G9QC4c5CcgXY6
	6Lbg==
MIME-Version: 1.0
X-Received: by 10.52.21.107 with SMTP id u11mr1630716vde.101.1359036307353;
	Thu, 24 Jan 2013 06:05:07 -0800 (PST)
Received: by 10.52.95.243 with HTTP; Thu, 24 Jan 2013 06:05:07 -0800 (PST)
In-Reply-To: <20130124134801.GD3012@jama>
References: <1359034562-31592-1-git-send-email-radu.moisan@intel.com>
	<20130124134801.GD3012@jama>
Date: Thu, 24 Jan 2013 15:05:07 +0100
Message-ID: <CALbNGRQF44R3YmQ0=i6AzCOfXgAmZXyZOqr2ZaV-On1Xt4tgMQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd: set default.target to multi-user.target
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
X-List-Received-Date: Thu, 24 Jan 2013 14:20:41 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jan 24, 2013 at 2:48 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Jan 24, 2013 at 03:36:02PM +0200, Radu Moisan wrote:
>> this fixes a service dependency issue;
>> while graphical.target is the default mode, systemd
>> will try to start display-manager.service which is not
>> available.
>
> what about images with display-manager available?
>
> meta-efl/recipes-efl/efl/entrance/entrance.service:Alias=display-manager.service
> meta-gnome/recipes-gnome/gdm/gdm/gdm.service.in:Alias=display-manager.service
> meta-oe/recipes-graphics/xserver-nodm-init/xserver-nodm-init/xserver-nodm.service:Alias=display-manager.service
>
> ?
>
> Making this change in global PKG_ARCH recipe doesn't look correct (and
> also missing Upstream-Status and SOB line).
>
> Cheers,
>
>> Signed-off-by: Radu Moisan <radu.moisan@intel.com>
>> ---
>>  .../systemd/set_default_target_to_multi-user.patch |   13 +++++++++++++
>>  meta/recipes-core/systemd/systemd_196.bb           |    1 +
>>  2 files changed, 14 insertions(+)
>>  create mode 100644 meta/recipes-core/systemd/systemd/set_default_target_to_multi-user.patch
>>
>> diff --git a/meta/recipes-core/systemd/systemd/set_default_target_to_multi-user.patch b/meta/recipes-core/systemd/systemd/set_default_target_to_multi-user.patch
>> new file mode 100644
>> index 0000000..d29471c
>> --- /dev/null
>> +++ b/meta/recipes-core/systemd/systemd/set_default_target_to_multi-user.patch
>> @@ -0,0 +1,13 @@
>> +Index: git/Makefile.am
>> +===================================================================
>> +--- git.orig/Makefile.am
>> ++++ git/Makefile.am
>> +@@ -3873,7 +3873,7 @@ systemd-install-data-hook:
>> +             $(LN_S) reboot.target runlevel6.target )
>> +     ( cd $(DESTDIR)$(systemunitdir) && \
>> +             rm -f default.target ctrl-alt-del.target autovt@.service && \
>> +-            $(LN_S) graphical.target default.target && \
>> ++            $(LN_S) multi-user.target default.target && \
>> +             $(LN_S) reboot.target ctrl-alt-del.target && \
>> +             $(LN_S) getty@.service autovt@.service )
>> +     ( cd $(DESTDIR)$(systemunitdir)/multi-user.target.wants && \
>> diff --git a/meta/recipes-core/systemd/systemd_196.bb b/meta/recipes-core/systemd/systemd_196.bb
>> index a78a8a6..c6798fc 100644
>> --- a/meta/recipes-core/systemd/systemd_196.bb
>> +++ b/meta/recipes-core/systemd/systemd_196.bb
>> @@ -23,6 +23,7 @@ SRC_URI = "http://www.freedesktop.org/software/systemd/systemd-${PV}.tar.xz \
>>             file://var-run.conf \
>>             ${UCLIBCPATCHES} \
>>             file://00-create-volatile.conf \
>> +           file://set_default_target_to_multi-user.patch \
>>            "
>>  SRC_URI[md5sum] = "05ebd7f108e420e2b4e4810ea4b3c810"
>>  SRC_URI[sha256sum] = "6bd4a658a5dd8198235b17ad1b1f0cc56d9e6f00d646ddcffdfc6f058b55e4bf"
>> --
>> 1.7.9.5
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
As far as I can see we will exchange a systemd warning that
display-manager.service cannot be started by a not started
display-manager for those using one.

Andreas


