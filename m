Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 797446FFD8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 20:06:45 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id y67so1243683wrb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Aug 2017 13:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MwsNIfc4+TkOLkrNnYpwy5S6o1KzWwm0ZsQq8z80q0A=;
	b=HYWFRizJrSObIy1VTtXbH6KQVYYbsevP3LAr9LbsyvKnZnYPVMiabnQkTPjVYiFxn0
	Rq78EAtoJ6eYT0aq9Wqi6Z0k+cjCGJ2xP+pPZY6mwAoS51Ec3KMBGZ0w9ntAnKZUH0mx
	9qOsB4auui6SJqrTGAQbXFkJxy6w1IScKuwF8NZOjfy8ULDG1wvtZuyIxqn2v5svmEK4
	oBnyx/7fkjkSj2VsJ3mEFILNt9CzlRaCoY18vGLnUVYLzkg6vD8dt4Oopn7UCdQmIClt
	DVLvDtRD3V387TxnKNd/TNRNu0MGyn2O/0uHx23kjX7iJDmSbIR87Hbanp/kYb5a3gE7
	7QNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MwsNIfc4+TkOLkrNnYpwy5S6o1KzWwm0ZsQq8z80q0A=;
	b=KUUPVj5flia00UK9hweiXtLtS6XmQpl0vFwWhNwfl9eRkFt2n8Jf+XWzti0K9egO6x
	2PAMz2fnr2MrqFJT/TtpMigylrX4JLfmXbs0ZHjGgkr2t50x4ZrqlbZByIPezXTPjW39
	Ykg9KGcBe9Z5/LbXVxlXoTIiQCI/5JouNzZAvZrPB92jyCeSxbZXMK2p9pmk70yE0qlp
	fSze1nHGWLlomasHthWs9OMyf+lt3+MuSwIYeN5cCGMWx99Z2QlY7hY7MCqtQUM1gxtQ
	xTC7gKceTlE15AN0EhmwRh2b5THaJpva8rLsxfgQI6HbvHBZouCROr6IQhOw+4kWunQZ
	VyCw==
X-Gm-Message-State: AHYfb5iTF4LouCQtEL0YUU72PjAswkrmT5BDnPGgfVMgGHoDVAx56app
	0JPSow2ZceROn8+sTcKuau3nmXjpCA==
X-Received: by 10.223.167.9 with SMTP id c9mr10324846wrd.180.1502395606991;
	Thu, 10 Aug 2017 13:06:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.175.16 with HTTP; Thu, 10 Aug 2017 13:06:46 -0700 (PDT)
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B6119E1224@ORSMSX112.amr.corp.intel.com>
References: <1502300913-40295-1-git-send-email-juro.bystricky@intel.com>
	<1502300913-40295-8-git-send-email-juro.bystricky@intel.com>
	<CAJ86T=Ud6Yh6m6+=n6DNaOm06fU+fc0L6ZhAoA32dDNSpTfWxg@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B6119E1224@ORSMSX112.amr.corp.intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Thu, 10 Aug 2017 13:06:46 -0700
Message-ID: <CAJ86T=WNn=gYeqUmODRxWOit_j9CGKj12Vy+xPvfzpifepL_ow@mail.gmail.com>
To: "Bystricky, Juro" <juro.bystricky@intel.com>
Cc: Juro Bystricky <jurobystricky@hotmail.com>,
	OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 07/11] image_types.bbclass: improve cpio image reproducibility
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
X-List-Received-Date: Thu, 10 Aug 2017 20:06:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 10, 2017 at 12:35 PM, Bystricky, Juro
<juro.bystricky@intel.com> wrote:
>>
>> Is it useful to keep the option using cpio from the host? Why not
>> always use cpio-native?
>
> I guess it is a judgement call which tools to build and which tools to use from the host. Not building tools which are guaranteed to be on the host saves build time.

I guess build time for cpio-native will be somewhere in the noise for
a typical build. Avoiding the extra complexity (code + test and QA) of
maintaining support for both cpio from the host and cpio-native would
seem to be far more of an issue. There's no guarantee that cpio is
available on the host (it currently needs to be installed manually if
building within the ubuntu:16.04 docker image, for example).

> Also, the need for cpio-native with the reproducible options it is going to be fairly rare.

I'm not sure I agree that wanting reproducible builds is a rare
requirement but if it is then isn't eliminating a rarely used code
path an argument *in favour of* switching to a single solution which
supports both cases?

>
>> >    do_image_cpio[depends] += "cpio-replacement-
>> native:do_populate_sysroot"
>> >    EXTRANATIVEPATH += "cpio-native"
>> >
>> > 2. Provide a way to pass custom arguments to cpio. This is done via
>> >    a new variable IMAGE_CMD_CPIO. For binary reproducible cpio archives
>> >    one needs to set (in local.conf)
>> >
>> >    IMAGE_CMD_CPIO = "cpio --ignore-devno --reproducible "
>> >
>> > 3. A symlink is created as part of the image. Here we make sure it gets
>> the
>> >    timestamps (mtime) based on the timestamp of the symlink target,
>> rather than
>> >    the timestamp corresponding to the build time.
>> >
>> > Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
>> > ---
>> >  meta/classes/image_types.bbclass | 14 ++++++++++++--
>> >  1 file changed, 12 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/meta/classes/image_types.bbclass
>> b/meta/classes/image_types.bbclass
>> > index e0368c7..50d0c07 100644
>> > --- a/meta/classes/image_types.bbclass
>> > +++ b/meta/classes/image_types.bbclass
>> > @@ -122,9 +122,17 @@ IMAGE_CMD_TAR ?= "tar"
>> >  # ignore return code 1 "file changed as we read it" as other tasks(e.g.
>> do_image_wic) may be hardlinking rootfs
>> >  IMAGE_CMD_tar = "${IMAGE_CMD_TAR} -cf
>> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} .
>> || [ $? -eq 1 ]"
>> >
>> > +# By default, cpio from the host is used, which can be quite old. If
>> > +# you need special parameters (like --ignore-devno --reproducible) which
>> are only
>> > +# supported by GNU cpio upstream >= 2.12, then override that default:
>> > +# IMAGE_CMD_CPIO = "cpio --ignore-devno"
>> > +# do_image_cpio[depends] += "cpio-replacement-
>> native:do_populate_sysroot"
>> > +# EXTRANATIVEPATH += "cpio-native"
>> > +
>> > +IMAGE_CMD_CPIO ?= "cpio"
>> >  do_image_cpio[cleandirs] += "${WORKDIR}/cpio_append"
>> >  IMAGE_CMD_cpio () {
>> > -       (cd ${IMAGE_ROOTFS} && find . | cpio -o -H newc
>> >${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
>> > +       (cd ${IMAGE_ROOTFS} && find . | ${IMAGE_CMD_CPIO} -o -H newc -v
>> >${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
>> >         # We only need the /init symlink if we're building the real
>> >         # image. The -dbg image doesn't need it! By being clever
>> >         # about this we also avoid 'touch' below failing, as it
>> > @@ -134,10 +142,12 @@ IMAGE_CMD_cpio () {
>> >                 if [ ! -L ${IMAGE_ROOTFS}/init ] && [ ! -e
>> ${IMAGE_ROOTFS}/init ]; then
>> >                         if [ -L ${IMAGE_ROOTFS}/sbin/init ] || [ -e
>> ${IMAGE_ROOTFS}/sbin/init ]; then
>> >                                 ln -sf /sbin/init
>> ${WORKDIR}/cpio_append/init
>> > +                               # improve reproducibility: set the link
>> mtime to be the same as the target
>> > +                               touch -h -r ${IMAGE_ROOTFS}/sbin/init
>> ${WORKDIR}/cpio_append/init
>> >                         else
>> >                                 touch ${WORKDIR}/cpio_append/init
>> >                         fi
>> > -                       (cd  ${WORKDIR}/cpio_append && echo ./init | cpio
>> -oA -H newc -F ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
>> > +                       (cd  ${WORKDIR}/cpio_append && echo ./init |
>> ${IMAGE_CMD_CPIO} -oA -H newc -F
>> ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.cpio)
>> >                 fi
>> >         fi
>> >  }
>> > --
>> > 2.7.4
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core

