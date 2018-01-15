Return-Path: <jobol@nonadev.net>
Received: from erza.lautre.net (erza.lautre.net [80.67.160.89])
	by mail.openembedded.org (Postfix) with ESMTP id D0B0478685
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jan 2018 14:33:47 +0000 (UTC)
Received: from d-jobol.iot.bzh (por56-1-78-229-206-229.fbx.proxad.net
	[78.229.206.229])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by erza.lautre.net (Postfix) with ESMTPSA id 3AC508F96;
	Mon, 15 Jan 2018 15:16:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=nonadev.net;
	s=alternc; t=1516025820;
	bh=nzQHcGZGYdNGwm5yQvced0+LHKq46JdTHWEFUYh78Ew=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YxF6gU2maS9TbQb+TTiGQvjEjWLPqjgW2vLIKX2Uz20jGOgNkTOxYCt4OdZLpf8Su
	R2urla3yt7Dge7OdUYrIklXDUa2gFvE25qFJhEL+7TBnKvnSehBlDGzigFlyFJu21H
	o7MQF7UTcrvJeVmELZJZNeeeludX0QLMfqcwfsJo=
Date: Mon, 15 Jan 2018 15:33:46 +0100
From: =?UTF-8?B?Sm9zw6k=?= Bollo <jobol@nonadev.net>
To: wenzong fan <wenzong.fan@windriver.com>
Message-ID: <20180115153346.44478168@d-jobol.iot.bzh>
In-Reply-To: <c8acc16f-41fa-5818-79a5-78e99eaec6af@windriver.com>
References: <20170309140706.19814-1-jobol@nonadev.net>
	<1489075674.7785.368.camel@intel.com>
	<20170309174815.056bc5a2@d-jobol.iot.bzh>
	<1489079885.7785.371.camel@intel.com>
	<20170315090430.69b17cc1@d-jobol.iot.bzh>
	<f2f3913c-05db-c304-4cd8-45067bf98fa2@windriver.com>
	<20180104111826.5c8f9036@d-jobol.iot.bzh>
	<1515062493.10775.21.camel@intel.com>
	<d85e2e6d-e7b1-8ebd-e3ce-01a26bdabbcc@windriver.com>
	<1515066650.10775.24.camel@intel.com>
	<7071668FA690C2448AC06FD9CFF240FD014013CF0D@ALA-MBC.corp.ad.wrs.com>
	<1515517307.6718.17.camel@intel.com>
	<c8acc16f-41fa-5818-79a5-78e99eaec6af@windriver.com>
X-Mailer: Claws Mail 3.15.1-dirty (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] shadow: 'useradd' copies root's extended attributes
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
X-List-Received-Date: Mon, 15 Jan 2018 14:33:48 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 10 Jan 2018 17:50:19 +0800
wenzong fan <wenzong.fan@windriver.com> wrote:

> On 01/10/2018 01:01 AM, Patrick Ohly wrote:
> > On Fri, 2018-01-05 at 01:07 +0000, Fan, Wenzong wrote: =20
> >> It works and will override the labels of home dir that SELinux
> >> applied, that's the issue.
> >>
> >> For SELinux enabled system, the user's home dir should have lavel
> >> 'user_home_dir_t' instead of 'etc_t', it prevents users from
> >> creating files in their home dir. =20
> >=20
> > Sounds like the "copy xattr" function needs to become a bit
> > smarter: it needs to understand some of the semantic involved and
> > skip those SELinux xattrs that are always meant to be set
> > dynamically by the running kernel.
> >=20
> > Wenzong, which xattrs are those? Do you agree with the proposed
> > solution? =20
>=20
> The xattr for selinux is "security.selinux":
>=20
> $ getfattr -n security.selinux /home/t1
> security.selinux=3D"user_u:object_r:user_home_dir_t:s0-s15:c0.c1023"
>=20
> I think the "attr_copy_file()" is doing right thing, but it should be=20
> used in a limited situation, such as only for Smack ...
>=20
> Thanks
> Wenzong

The LSM "SELinux" is complicated enough to change label of template
files to label of instance files correctly. The approach with Smack is
different and the template files embed the expected complex hierarchy
that otherwise could only be created with a program.

A possible approach would be with smack to add a program for creating
homes. Conversely, SELinux could consider to use template approach too
instead of increasing its rules set (with templating splitted in two
parts: files and "creation" rules).

=46rom "man 7 xattr" we know:
 - extended attributes are namespaced
 - the fully qualified name is "namespace.attribute"
 - actual namespaces are security, system, trusted, and user

A possibility would be to filter the copied extended attributes. For
SELinux we can just tell to not copy "security" attributes. See
manual of the command "tar" (recent version) that has options
--xattrs-exclude and --xattr-include.

Is there a need to copy extended attributes except for Smack?

> > Jose, can you look into updating your patch accordingly?

Perhaps yes but not now because I don't now what to do.

Best regards
Jose

