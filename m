Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id 0EFF16013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 13:38:21 +0000 (UTC)
Received: by igcxg11 with SMTP id xg11so53900736igc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Mar 2015 06:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=wO4WDRFRLjUVLtuLf8VBVBmQ0b3jgsQKPzOcO771Ibk=;
	b=DjS8uiJMvn19zPiI+nvtt0ZbmiuGeE7duuEcoGaaQoAvJBrH3FNsJKhk11n69Og79c
	qg7UmPaPRFcncvXS5atMN3mZ23P9aVZKDtMMico2wymhrOWMvMwSLb8QWelrE7rMeSNA
	a1IRgUMqtsG0wuNV+zBvZCSEiKHYvOFDZbWDdbD6TjuNake9huDxIv1Cl9/3aE60KF8G
	NFoyrtZcnGB149RrkQftlqHsDtZXIPOKvYMZIbgQdOa4y67oRyYaVD4TBoqJsipGc2TZ
	k+bTXjs9Kz5snaJezNP3N/w8/dmp/rhQPniqZpSFXKEzKI3m0X26MFAeZATOvS/o7MF+
	P3vA==
MIME-Version: 1.0
X-Received: by 10.107.34.210 with SMTP id i201mr21409626ioi.1.1427377102387;
	Thu, 26 Mar 2015 06:38:22 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.107.133.21 with HTTP; Thu, 26 Mar 2015 06:38:22 -0700 (PDT)
In-Reply-To: <1427376824.2918.3.camel@bottazzini-ThinkPad-T430>
References: <bruno.bottazzini@intel.com>
	<1427320163-9262-1-git-send-email-bruno.bottazzini@intel.com>
	<1427320163-9262-4-git-send-email-bruno.bottazzini@intel.com>
	<5513C8D7.9070700@opendreambox.org>
	<1427376824.2918.3.camel@bottazzini-ThinkPad-T430>
Date: Thu, 26 Mar 2015 10:38:22 -0300
X-Google-Sender-Auth: qJUc6omDbILYs1fc45brtQEeHa0
Message-ID: <CAP9ODKoe_h-Xx7vhSrT7tOBQkP32sOKh1gBcySnqm5Ujx9RFpg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Bottazzini, Bruno" <bruno.bottazzini@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] systemd: split modules into packages
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
X-List-Received-Date: Thu, 26 Mar 2015 13:38:23 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 26, 2015 at 10:33 AM, Bottazzini, Bruno
<bruno.bottazzini@intel.com> wrote:
> On Qui, 2015-03-26 at 09:52 +0100, Andreas Oberritter wrote:
>> Hi Bruno,
>>
>> On 25.03.2015 22:49, Bruno Bottazzini wrote:
>> > if one wants to launch a simple deamon, most modules are not
>> > required.
>> > He will be able to save space and exclude unwanted packages
>> > from the final image.
>> > ---
>> >  meta/recipes-core/systemd/systemd_219.bb | 1073 ++++++++++++++++++++++++++----
>> >  1 file changed, 943 insertions(+), 130 deletions(-)
>> >
>> > diff --git a/meta/recipes-core/systemd/systemd_219.bb b/meta/recipes-core/systemd/systemd_219.bb
>> > index e2ea81e..9bb104f 100644
>> > --- a/meta/recipes-core/systemd/systemd_219.bb
>> > +++ b/meta/recipes-core/systemd/systemd_219.bb
>> > @@ -19,7 +19,7 @@ PROVIDES = "udev"
>> >
>> >  PE = "1"
>> >
>> > -DEPENDS = "kmod docbook-sgml-dtd-4.1-native intltool-native gperf-native acl readline dbus libcap libcgroup glib-2.0 qemu-native util-linux"
>> > +DEPENDS = "intltool-native gperf-native readline libcap libcgroup qemu-native"
>> >
>> >  SECTION = "base/shell"
>> >
>> > @@ -62,23 +62,45 @@ LDFLAGS_append_libc-uclibc = " -lrt"
>> >
>> >  GTKDOC_DOCDIR = "${S}/docs/"
>> >
>> > -PACKAGECONFIG ??= "xz ldconfig \
>> > +PACKAGECONFIG ??= " \
>> > +                   gcrypt \
>> > +                   kmod \
>> > +                   ldconfig \
>> > +                   ${@bb.utils.contains('DISTRO_FEATURES', 'blkid', 'blkid', '', d)} \
>> > +                   ${@bb.utils.contains('DISTRO_FEATURES', 'efi', 'efi', '', d)} \
>> > +                   ${@bb.utils.contains('DISTRO_FEATURES', 'lz4', 'lz4', '', d)} \
>> > +                   ${@bb.utils.contains('DISTRO_FEATURES', 'xz', 'xz', '', d)} \
>> > +                   ${@bb.utils.contains('DISTRO_FEATURES', 'libidn', 'libidn', '', d)} \
>>
>> please don't invent new distro features for packageconfig of a single
>> recipe.
>>
>> Regards,
>> Andreas
>
> Andreas,
>
> Firstly, thank you a lot, for reviewing this patch
>
>
> How would you suggest to change this code ?
>
> Should I do the following ?
>
> PACKAGECONFIG ??= " \
>                    gcrypt \
>                    kmod \
>                    ldconfig \
>                    blkid \
>                    efi \
>                    ... \
> an so on ?

Yes.

Virtually all options which can be enabled/disabled should have a
PACKAGECONFIG entry and you shouldn't change the features which are
enabled/disabled in this commit. This can potentially be done in
another next commit but will be unlikely to be ported for fido as it
may impose bad surprises for users.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

