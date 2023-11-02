Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C2A7C4332F
	for <webhook@archiver.kernel.org>; Thu,  2 Nov 2023 08:32:26 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.26356.1698913941295546814
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Nov 2023 01:32:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KV+9C36z;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-9d2c54482fbso98076766b.2;
        Thu, 02 Nov 2023 01:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698913940; x=1699518740; darn=lists.openembedded.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=JxhBTAo8dsqwwWs57bOmnRMBcvk1ZvYeWWSlOqLitxc=;
        b=KV+9C36ziSjxzb0gwN9CiqGsT2MbAkgV3r2SA6FVM0bXpY8gd3g7wYTHD+hx+jF1lb
         XiPo/FpznqH5aXHJt9PPHvjTigOkP4u04Qg7XfDOifqxTQfQKh4zYGNV+EwSXo3WfaiZ
         d9dhri7x+qhp5gzvNz6Y7Wc/y+N0V9DCpPNtS+LN8FaALY6+W6AN3HUXCjKVkxS54YUD
         /riBvDwJDkg5Bceqr67Rsa8MtrkW13cz5YrCQXZG9fP8Jf6Rx6yIzwjAJDQ1ixG75Hy9
         7GjonA0Y+9+NFqh1XR4rGo8SHjBLgCPlx7Gt/m1RjlwGcBZDNscT4xnbdnxZ9FW4dFVB
         terA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698913940; x=1699518740;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JxhBTAo8dsqwwWs57bOmnRMBcvk1ZvYeWWSlOqLitxc=;
        b=BOEdGOi7cSwvTADHIhSFM4fq7xxWhlG6C8qN/NYMwINpeBG5G4RVfvaZZm/cdMZfi4
         6VKHOLT7AHCzSnOoAKJ72LZioRpEajxOJ6Q+zbBF1EpdqC8jpFlsWr4g+63joBY3MsBY
         6KjcQ8hhdQfFkXYhm1ft0ejYrIhqiS2/T59wJt/h1RsrHkbmQzw94zJLNCJsaywcCagQ
         LxZAt+AWvcNS1t2nWaGSP5MZHhD1kbqbaYtSRrC9+JawNz6xFibhUywQ3A+TJeFSBfN+
         zml2fgP4fF7Xzo8qzD3kAkeGD8YDjVLrlJwGNE6yNqqVUX8QD1uFfarZ99y9+RcbPLyh
         Algw==
X-Gm-Message-State: AOJu0YyvWAGXJXZu+lsoi8GVml2S+kzZFBIg0Botrl9tIzUbgTrInISR
	TKw5z5TOSfWQBEYfVTbQCBo=
X-Google-Smtp-Source: AGHT+IHtNVDxMqkozQ45zu+Th0GmV6xOQtSCeQnTJL3CYAnfAmwW0gL7wgUt8zCSLzTbiEYHpDm8DQ==
X-Received: by 2002:a17:907:968c:b0:9be:2469:bdf5 with SMTP id hd12-20020a170907968c00b009be2469bdf5mr3866435ejc.15.1698913939444;
        Thu, 02 Nov 2023 01:32:19 -0700 (PDT)
Received: from ?IPv6:2a02:169:59a6:0:5488:f785:9061:cf6c? ([2a02:169:59a6:0:5488:f785:9061:cf6c])
        by smtp.gmail.com with ESMTPSA id g9-20020a1709063b0900b009a9fbeb15f5sm830557ejf.46.2023.11.02.01.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 01:32:18 -0700 (PDT)
Message-ID: <d53017757cc59380fea417cf36cdeea25b9770d8.camel@gmail.com>
Subject: Re: [yocto] Core workflow: sstate for all, bblock/bbunlock, tools
 for why is sstate not being reused?
From: adrian.freihofer@gmail.com
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
 openembedded-architecture
 <openembedded-architecture@lists.openembedded.org>, Yocto-mailing-list
 <yocto@lists.yoctoproject.org>, 
 ",openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>, Julien STEPHAN
 <jstephan@baylibre.com>
Date: Thu, 02 Nov 2023 09:32:18 +0100
In-Reply-To: <CANNYZj_4e5XbTgcv_ZdqJArCA+=bTj+kmWYVveHDVXyC3TK+rA@mail.gmail.com>
References: 
	<CAK5yBb9gO+WOJrv4TArzXK_1Bxu5AORp2oi=P-v=2nn6PgJE5Q@mail.gmail.com>
	 <CANNYZj9QpstUj_A8Vb2RbiaFGZkHkFjHkUfF=E1HR-nDJ_Vk6w@mail.gmail.com>
	 <81f4c191fe6dead1feec6bfc0d36aa328af1f7d4.camel@linuxfoundation.org>
	 <CANNYZj-JhGnGFRxaF0+Q_5Sqq76kAg1pSBBMka_xefuhMv6-vQ@mail.gmail.com>
	 <ea84079102bca429a6ae521d218118952a79f111.camel@linuxfoundation.org>
	 <feee5d39bc3e280c76b749f39761936464c4cdff.camel@gmail.com>
	 <CANNYZj_4e5XbTgcv_ZdqJArCA+=bTj+kmWYVveHDVXyC3TK+rA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Nov 2023 08:32:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190067

On Wed, 2023-11-01 at 18:28 +0100, Alexander Kanavin wrote:
> On Wed, 1 Nov 2023 at 16:45, <adrian.freihofer@gmail.com> wrote:
> > I think these differences between SDK and bitbake environment are
> > no
> > longer required and they have been problematic. I would try to make
> > the
> > bitbake environment usable like the eSDK environment was without
> > trying
> > to replicate all the details of the eSDK installer such as these
> > local.conf settings.
>=20
> I have now split up the populate_sdk_ext into separate functions [1]
> for better maintainability, and the more I think about what to do
> next, the more I agree with Adrian. I just don't see why (in a
> standard yocto build) would we want to manipulate PATH to provide a
> restricted set of tools, or to create a "local.conf+extra stuff"
> (locked signatures, esdk tweaks) environment, when existing
> local.conf
> by itself is already working fine, and full set of tools is better
> than a restricted one. If we want to add or remove locked signatures,
> this can be done with 'bitbake -s lockedsigs' or bblock for specific
> recipes only. And SDK's cross-toolchain is accessible via
> meta-ide-support/build-sysroots flow.
>=20
> [1]
> https://git.yoctoproject.org/poky-contrib/commit/?h=3Dakanavin/sstate-for=
-all

Splitting allows to copy the new function with the + from the patch
into this email and comment it.

+python copy_buildsystem () {
+ import oe.copy_buildsystem
+
+ baseoutpath =3D d.getVar('SDK_OUTPUT') + '/' + d.getVar('SDKPATH')
+
+ # Determine if we're building a derivative extensible SDK (from
devtool build-sdk)
+ derivative =3D (d.getVar('SDK_DERIVATIVE') or '') =3D=3D '1'

What's the advantage of that? There are now two worlds: The bitbake
world and the SDK world which behave similar but not equal. Both need
to be maintained and tested.

We use only bitbake on our CI/CD infrastructure. For users who have
only the eSDK installed, it's hard to understand what the CI does and
even harder to reproduce errors happening on the CI.

We also had some setups with a containerized eSDK on the CI for the
integration of application source code. But this did not work at all.
The SDK container is basically outdated when the first component of the
firmware gets updated. If other components depend on that component an
SDK container update is required. Handling breaking changes easily is a
big advantage of bitbake which gets lost when using any kind of locked
or badly packaged variant of it.

+
+ conf_initpath, conf_bbpath, core_meta_subdir, sdkbblayers =3D
copy_bitbake_and_layers(d, baseoutpath, derivative)

Changing the directory layout leads to many pitfalls especially if more
layers than just poky are used. This should be replaced by the new
bitbake-layers tools. This means there is only one official way for
setting up bitbake layers and the folder structure gets exactly
replicated.

+
+ write_devtool_config(d, baseoutpath, conf_bbpath, conf_initpath,
core_meta_subdir)

Not sure there is much left when we have only the bitbake world. But
defining some defaults might be still useful.

+
+ write_unlocked_sigs(d, baseoutpath)

Lets turn this more towards a QA check. As a SDK maintainer I would
like to provide SDKs with 100% sstate included. But as a user, if I
have a choice between waiting a few minutes until bitbake compiled some
missing parts or getting an error message telling me I can't get an SDK
now, I'd probably choose compile.
If I remember correctly, with the old eSDK installer this is even
worse. This error happens during the installation which leads to an SDK
in an undefined state. The user must delete it again and fix the
generation of the SDK installer, which might be a very complicated and
time consuming task with the existing tools.

+
+ write_bblayers_conf(d, baseoutpath, sdkbblayers)

Also something which can be replaced by the new bitbake-layers utility.

+
+ uninative_checksum =3D copy_uninative(d, baseoutpath)

Not sure if this is still needed. With a bitbake environment this just
happens from sstate, I guess. So why doing it differently for the SDK?

+
+ write_local_conf(d, baseoutpath, derivative, core_meta_subdir,
uninative_checksum)

Also something which can be replaced by the new bitbake-layers utility.

+
+ prepare_locked_cache(d, baseoutpath, conf_initpath)

The sstate could be shipped in three different ways:
 * Included in the installer and just extracted into $SSTATE_DIR. This
   is simple but it does not scale at all. If you maintain multiple
   distros and MACHINES and want to have fast update cycles,
   distributing complete sstate archives quickly becomes practically
   impossible, as the same data is packed into several huge archives.
   That leads to issues on the infrastructure side. But also on the
   user's machine having one sstate folder e.g. ~/sstate-cache instead
   of several $TMPDIR/sstate-cache folders is beneficial.
 * No sstate is included, the sstate gets "lazy" fetched from
   SSTATE_MIRROR. Also that looks easy but does not scale very well for
   the SDK use case. bitbake opens a connection for every setscene task
   which is usually handled as a denial of service attack by modern
   infrastructures.
   Fetching in the setscene tasks does not cache the sstate artifact
   locally (not 100% sure here). So whenever the same setscene tasks
   runs again a new download is needed. This is not efficient and also
   not the quickest possible implementation. Local caching is important
   for the sstate.
 * An sstate-download script which downloads the sstate from the
   SSTATE_MIRROR into SSTATE_DIR before bitbake gets started is working
   very well for us. We share the sstate cache via sftp. This allows us
   to use the public keys which we anyway need for git for the
   authentication and authorization. Since the download script opens
   more than one connection for downloading the speed is also very
   nice. We are still evaluating this. The script is not really
   upstreameable. It's very specific to our infrastructure.
  =20
Probably a bad idea, or something for later: A download script would
have all the logic for finding the required sstate files on the client.
Not sure if also a server side implementation could be interesting. I'm
thinking about a service with access to the shared sstate of a build
infrastructure. The client could ask for an sstate bundle for a given
recipe and the server would pack it on the fly. Similar to what git
does. Intelligence on the server side would also allow to have a fine
grained authorization concept e.g. per sstate artifact.

+
+ write_manifest(d, baseoutpath)

Not sure if this is still needed.

+
+}


>=20
> THAT SAID. I also agree there should be a way to package the
> 'standard
> yocto build' that does not also do 'weird esdk stuff' on top. Just a
> tarball that has 'everything', and that you unpack and get a standard
> build exactly like the one that was used to produce the tarball.
> Something like what Adrian suggested: basically place all information
> needed to replicate a build into one place, then either make a
> tarball
> out of it (with sstate for fast builds), or publish it into the
> network. We might be able to reuse some of esdk packaging code for
> this, or we might not, but I think this is the direction that should
> be taken.

Ideally the "new installer" can be extracted/installed over an existing
SDK=3Dbitbake setup. I think the bitbake-layer tool supports this for the
layers. Extracting a full sstate archive into an already populated
folder should also just work, I assume.

Such a design would allow more advance users to just use git and an
editor to change their SDK. But it would also support less experienced
users with a process where they can just download a minimal installer
which brings the SDK=3Dbitbake into a defined state.

Sorry for repeating some parts which we already had in other emails.
But I tried to summarize the lengthy discussion a bit in one place.

Thank you very much!

Adrian

>=20
> Alex


