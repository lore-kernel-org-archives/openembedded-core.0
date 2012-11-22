Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TbSnD-0005xl-NW
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 10:09:55 +0100
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 22 Nov 2012 00:55:08 -0800
Received: by mail-ob0-f197.google.com with SMTP id za17so30485895obc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2012 00:55:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=kuCMvSf2hgwtvjq9dswhWL/48xa+4RoHpsdZJiQ66mk=;
	b=GDCNAYWkFr8RrKHccID/MGwjxjL32pStO8kiNzv8FPcLxbteujsEItqlhR72VSrWdc
	mzce5eQ0/mpFjOqVZJfCqS8k18vcEZoBA0lBLclRELj/U77BulfeIEHJU6ar/GrwC6MC
	5jk9u7MokgSBqeLkMDaMX9EoqYlx1W3rLnLc7UrXNurNIVnwBfxZ/u+IBlhdBdRom1fM
	76EfWZLq+8yGjnFV0kGiY9/sY+OmMkt2udX0v4LAXmE5ouWeZcOy8oziEIaX4l9prG3d
	7Gj6pABXV/DPztrVts2mif0HMHOBKzoqB8jTeVEO4uKeW4wUkQc9SDhjWOcViisYSDgB
	6gXg==
Received: by 10.60.172.138 with SMTP id bc10mr18975673oec.33.1353574547572;
	Thu, 22 Nov 2012 00:55:47 -0800 (PST)
Received: by 10.60.172.138 with SMTP id bc10mr18975666oec.33.1353574547466;
	Thu, 22 Nov 2012 00:55:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Thu, 22 Nov 2012 00:55:26 -0800 (PST)
In-Reply-To: <6ef7001b467caa7cebe92e399a94a9680265efb8.1353564658.git.jackie.huang@windriver.com>
References: <cover.1353564658.git.jackie.huang@windriver.com>
	<6ef7001b467caa7cebe92e399a94a9680265efb8.1353564658.git.jackie.huang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 22 Nov 2012 08:55:26 +0000
Message-ID: <CAJTo0LYHjhAfak4gFoRWeo+R7g86P9q4rgmWreAnOosr0A+a-Q@mail.gmail.com>
To: jackie.huang@windriver.com
X-Gm-Message-State: ALoCoQnxX6eLSnllQNIRE4oygsn3iaKN3Vys8LVdNPCb0Mi595vtkfOqR/UHICQRHyZrTxD2q8SCsAqQHGE23DybMSxnCEKG6DBPVgopAv6zq3h7FlFfr+J5GDAeoJC0eRrqcAF6wTuAu+Z4AoGwuoyyTuOxPD/OYDDkq7Nxocfl2sKJm8hnIFUHaFRaMDcWLEv0pJDxdcH0
Cc: saul.wold@intel.com, Shiqun.Lin@windriver.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] pulseaudio: fix compilation on RHEL-5.8 64bit machine
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
X-List-Received-Date: Thu, 22 Nov 2012 09:09:56 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

This patch is too hacky to go in at the moment.

On 22 November 2012 06:46,  <jackie.huang@windriver.com> wrote:
> ../bitbake_build/tmp/sysroots/qemux86-64/usr/lib64/libgdk-x11-2.0.so: undefined reference to `XRRGetOutputInfo'

Which means your GTK+ linkage is broken, because libgdk should be
linking to libXrandr.  Mine is, can you verify that yours is too?

> +-AM_LDADD = $(PTHREAD_LIBS) $(INTLLIBS)
> ++AM_LDADD = $(PTHREAD_LIBS) $(INTLLIBS) -lXrandr

You're adding linkage to libXrandr to every part of PulseAudio.  What
binary in pulseaudio is failing to compile with this error?

> -DEPENDS += "libjson gdbm speex libxml-parser-perl-native"
> +DEPENDS += "libjson gdbm speex libxml-parser-perl-native \
> +  ${@base_contains('DISTRO_FEATURES', 'x11', 'libxrandr', '', d)}"

pulseaudio.inc has:

DEPENDS = "libatomics-ops liboil avahi libsamplerate0 libsndfile1 libtool \
           ${@base_contains('DISTRO_FEATURES', 'x11', 'virtual/libx11
libxtst libice libsm libxcb gtk+', '', d)}"

As gtk+ pulls in libxrandr, this is redundant.

Ross


