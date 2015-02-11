Return-Path: <matt@madison.systems>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6E83A609B2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 12:33:01 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id lf10so3667955pab.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Feb 2015 04:33:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:content-type:mime-version:content-transfer-encoding;
	bh=L5P3Y3X1WE4GMneJA604CHZO4796wpFr+Ud8FNk/jHo=;
	b=R0z0Uwx0K1NdjiM65MXNHlQsAvhLzTo7MPXeTFgSmbXDr9p4kcQtPVqLJo6Hv4SA16
	SUvIZZqwaTlwnKA+zAHNUHU50xIBarky8I7xmPLPJLbBhD+s2g3W+4z8qD8rXW2zqrqD
	0vYNeFAXoczGp40G8pZvB34NaCDzo4QzO7LIl2yMrj04Q/ywYlKfrgjKAUnapGzAhlS/
	3O+qVVJ655zkyY1oAnaB9YjUj7Hqqc5YC+uvYbHlTBXB5gq4CiugN2jhy8pJE1H3jvoo
	65tC6kgckBexKmAL8hrHKH8eDl2BjDghoiiFQYA3VEr+/pvfyQrFlPiPH0rniXqiBX2v
	kkiQ==
X-Gm-Message-State: ALoCoQlfOz8Mx8N/eykylZADglQjR8fF5lREzB4J5YpbcOQBGXX3YhFvtvpdgpKG4TtjcNtmr/2g
X-Received: by 10.70.56.102 with SMTP id z6mr951579pdp.18.1423657983188;
	Wed, 11 Feb 2015 04:33:03 -0800 (PST)
Received: from [172.16.1.18]
	(70.90.175.93-BusName-ca.sfba.hfc.comcastbusiness.net.
	[70.90.175.93])
	by mx.google.com with ESMTPSA id fu14sm833642pad.44.2015.02.11.04.33.02
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Feb 2015 04:33:02 -0800 (PST)
Message-ID: <1423657981.6238.8.camel@workhorse.madison.systems>
From: Matt Madison <matt@madison.systems>
To: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
Date: Wed, 11 Feb 2015 04:33:01 -0800
In-Reply-To: <54DB2D2C.3010404@herbrechtsmeier.net>
References: <CAGgRHJpOuqFFie9tycFK+7N5nj_GjfP3oGTAAyZoy+i3tpAfvA@mail.gmail.com>
	<54DB2D2C.3010404@herbrechtsmeier.net>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: cmake.bbclass questions
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
X-List-Received-Date: Wed, 11 Feb 2015 12:33:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2015-02-11 at 11:21 +0100, Stefan Herbrechtsmeier wrote:
> Am 10.02.2015 um 23:53 schrieb Matt Madison:
> > I just finished some recipes for some CMake-built packages (from the 
> > Kurento project).  I managed to get everything building, but I had to 
> > modify how cmake.bbclass does things, and I'm wondering if there's a 
> > better way to solve some of these.
> >
> > Each of the packages generates a pkg-config file and a CMake module 
> > that are then used by other packages (later in the build) to locate 
> > their dependencies.  I see that cmake.bbclass hard-codes the 
> > CMAKE_MODULE_PATH setting to point to just the location in the native 
> > sysroot, but target packages can't install their CMake modules there.  
> > I tweaked the definition so that when building non-native packages, 
> > CMAKE_MODULE_PATH points into both the target sysroot and the native 
> > sysroot.  This seemed to do the trick, but wasn't sure it was the 
> > correct way to solve this.
> Instead of a CMake module the project should install a 
> <Name>Config.cmake in its data directory and append a private module 
> directory to the CMAKE_MODULE_PATH.

Ah, OK. Is that the typical pattern for CMake-based packages?  

> 
> > The generated pkg-config files were a bit trickier - the CMakefiles 
> > that generate them assume that the CMAKE_INSTALL_xxxDIR variables are 
> > always relative paths, but cmake.bbclass passes in absolute paths -- 
> > which, by my read of the CMake docs, is allowed.  I think in this case 
> > the Kurento CMakefiles need fixing, but there were a lot of them, so 
> > it was simpler to change cmake.bbclass to strip the prefix off the 
> > front of those variable settings.
> CMake supports relative and absolute paths for the CMAKE_INSTALL_xxxDIR 
> variables but the default are relative paths.
> 
> The CMake files sould be fixed and extract the relative path from the 
> full path variable:
> file (RELATIVE_PATH CMAKE_INSTALL_RELATIVE_LIBDIR 
> "${CMAKE_INSTALL_PREFIX}" "${CMAKE_INSTALL_FULL_LIBDIR}")

Great, thanks, I'll suggest that to them.

Regards,
-Matt



