Return-Path: <matt@madison.systems>
Received: from mail-qg0-f49.google.com (mail-qg0-f49.google.com
	[209.85.192.49])
	by mail.openembedded.org (Postfix) with ESMTP id EB4B77066B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 22:53:11 +0000 (UTC)
Received: by mail-qg0-f49.google.com with SMTP id q107so18495955qgd.8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Feb 2015 14:53:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=bSeAfxlZ4bkuTFyHmUl6oCQu4CRqmrN22craCsa9b64=;
	b=RDEVEdy41oNrYL2hLFEoATM9ECOOVOIQwwihiZsUQ9VekC33WRauS95ndpDJ0wj2v0
	rpOyuBXhOlS7SnAOj+M+5Fxi9egFw0I7LFVmqxu86J2MVep7M7suub2w7BiqBoBrK4p9
	nyvi332TiyqS5cJDsrNimnbC5spJbWlewwHr0XvSRNScFZ8jpKtdPqE9UEWVfXJA2/zk
	g8PcG5Hyx3NBmVq1vjAwi5DBeP58R2/EedoHfkYmXaNhHXJu259u68FMAxsynvCTA3A3
	KrVrZdY5DFRUMm1J9dvv0DFNkr2acPP6y/4jLV69kn/7tq5XvvolJctZuLaVGrmuKWDP
	OR2Q==
X-Gm-Message-State: ALoCoQmKDYEvnrIVm0zaLkIYlN0QsODlI7fd6nMGPihPDG5PK4xF1xIY42vyEZIi01haWlohpphM
MIME-Version: 1.0
X-Received: by 10.140.42.83 with SMTP id b77mr51379166qga.43.1423608792181;
	Tue, 10 Feb 2015 14:53:12 -0800 (PST)
Received: by 10.140.48.7 with HTTP; Tue, 10 Feb 2015 14:53:12 -0800 (PST)
X-Originating-IP: [64.71.1.115]
Date: Tue, 10 Feb 2015 14:53:12 -0800
Message-ID: <CAGgRHJpOuqFFie9tycFK+7N5nj_GjfP3oGTAAyZoy+i3tpAfvA@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
To: openembedded-core@lists.openembedded.org
Subject: cmake.bbclass questions
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
X-List-Received-Date: Tue, 10 Feb 2015 22:53:14 -0000
Content-Type: multipart/alternative; boundary=001a11c130545b83c5050ec3c07a

--001a11c130545b83c5050ec3c07a
Content-Type: text/plain; charset=UTF-8

I just finished some recipes for some CMake-built packages (from the
Kurento project).  I managed to get everything building, but I had to
modify how cmake.bbclass does things, and I'm wondering if there's a better
way to solve some of these.

Each of the packages generates a pkg-config file and a CMake module that
are then used by other packages (later in the build) to locate their
dependencies.  I see that cmake.bbclass hard-codes the CMAKE_MODULE_PATH
setting to point to just the location in the native sysroot, but target
packages can't install their CMake modules there.  I tweaked the definition
so that when building non-native packages, CMAKE_MODULE_PATH points into
both the target sysroot and the native sysroot.  This seemed to do the
trick, but wasn't sure it was the correct way to solve this.

The generated pkg-config files were a bit trickier - the CMakefiles that
generate them assume that the CMAKE_INSTALL_xxxDIR variables are always
relative paths, but cmake.bbclass passes in absolute paths -- which, by my
read of the CMake docs, is allowed.  I think in this case the Kurento
CMakefiles need fixing, but there were a lot of them, so it was simpler to
change cmake.bbclass to strip the prefix off the front of those variable
settings.

I don't know that much about CMake, so if anyone has any advice, I'd
appreciate it.

Thanks,
-Matt

--001a11c130545b83c5050ec3c07a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I just finished some recipes for some CMake-built packages=
 (from the Kurento project).=C2=A0 I managed to get everything building, bu=
t I had to modify how cmake.bbclass does things, and I&#39;m wondering if t=
here&#39;s a better way to solve some of these.<div><br></div><div>Each of =
the packages generates a pkg-config file and a CMake module that are then u=
sed by other packages (later in the build) to locate their dependencies.=C2=
=A0 I see that cmake.bbclass hard-codes the CMAKE_MODULE_PATH setting to po=
int to just the location in the native sysroot, but target packages can&#39=
;t install their CMake modules there.=C2=A0 I tweaked the definition so tha=
t when building non-native packages, CMAKE_MODULE_PATH points into both the=
 target sysroot and the native sysroot.=C2=A0 This seemed to do the trick, =
but wasn&#39;t sure it was the correct way to solve this.</div><div><br></d=
iv><div>The generated pkg-config files were a bit trickier - the CMakefiles=
 that generate them assume that the CMAKE_INSTALL_xxxDIR variables are alwa=
ys relative paths, but cmake.bbclass passes in absolute paths -- which, by =
my read of the CMake docs, is allowed.=C2=A0 I think in this case the Kuren=
to CMakefiles need fixing, but there were a lot of them, so it was simpler =
to change cmake.bbclass to strip the prefix off the front of those variable=
 settings.</div><div><br></div><div>I don&#39;t know that much about CMake,=
 so if anyone has any advice, I&#39;d appreciate it.</div><div><br></div><d=
iv>Thanks,</div><div>-Matt</div></div>

--001a11c130545b83c5050ec3c07a--
