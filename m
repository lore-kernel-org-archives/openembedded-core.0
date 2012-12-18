Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tkyo8-0003Dg-Dg
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 16:10:12 +0100
Received: from mail-vb0-f70.google.com ([209.85.212.70])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 18 Dec 2012 06:54:36 -0800
Received: by mail-vb0-f70.google.com with SMTP id r6so1076109vbi.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2012 06:55:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=MGGqGwc4xbKelxgLf2qXLuB2ORPsm2+3p42xMEhZ2Ew=;
	b=WXQKLvhMUtJ1jHgCPCDhsfTXn7hzS7ACsoR76kp+ZJs5TUEcwe1rOfvwUTKcPuIMUF
	4xtB+8RmBz93CGKUAJ3U+26y/A0SPvRLKsmbJ+vcpuCwLiqgyOj/5/kPMGSwqHyvDuco
	PmTwITrLQqsCIuTiOb348sDFomhpN3MNqwHzGB9FmL1D8hsY3DcSLj30Y4mRMLK/Ei17
	v9G2WCpeGIjpY7dedt5fDrxDx5hjjuqhJ55HESNI8e+Zmi/9WamWE+6zi2ZNW6MJ/G2q
	XIE9dTk8CpikIL3hamsfKDVSNTtv5Iqf0HAFkJ24HUi3koNhZBNBBQ4eojycWZIBEEKw
	gPEQ==
X-Received: by 10.58.221.130 with SMTP id qe2mr3593181vec.14.1355842528228;
	Tue, 18 Dec 2012 06:55:28 -0800 (PST)
Received: by 10.58.221.130 with SMTP id qe2mr3593163vec.14.1355842528008; Tue,
	18 Dec 2012 06:55:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Tue, 18 Dec 2012 06:55:07 -0800 (PST)
In-Reply-To: <1355839120-12142-2-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
References: <1355839120-12142-1-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
	<1355839120-12142-2-git-send-email-lukas.bulwahn@oss.bmw-carit.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Dec 2012 14:55:07 +0000
Message-ID: <CAJTo0LavddUVfHnF2qVGgE9U2Vb7NtbL_B3M5PPtHNV6V6D8qg@mail.gmail.com>
To: Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de>
X-Gm-Message-State: ALoCoQlWeIG8ieZXQPdhIh9DxkUI4/JPY0TCFgJ1qxiWwu9/UWaHFZHr2oHSMTm0Qt2mC5QlIlORtPbKmOdsqkiaeiJkrhNOBVUguTbmoLriBRoTkK3+zo+57iHOB9ykAXezSBjmqCQCYuUUnM9eVheUQgClJj2KMmwGeC6nTaOKmBZRgHh6ndy3Q+sWYZeVOnVOX//29KJw
Cc: Lukas Bulwahn <lukas.bulwahn@bmw-carit.de>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] easyinstall: class to create and extend the easyinstall.pth file
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
X-List-Received-Date: Tue, 18 Dec 2012 15:10:12 -0000
Content-Type: text/plain; charset=UTF-8

On 18 December 2012 13:58, Lukas Bulwahn <lukas.bulwahn@oss.bmw-carit.de> wrote:
> When installing python packages that are installed with python's easyinstall,
> the installation creates easyinstall.pth files. This file must exist in the
> root filesystem so that python 2.7 can locate and import the installed modules
> in the host system.

Is this the logic that where packages get installed as Eggs, so into
e.g. /usr/lib/python2.7/site-packages/Foo-1.0/ instead of
../packages/foo)?  In that case we're basically having to deal with a
lot of complication.   I've been battling this a bit with python-mako
and this section of the setuptools document applies to us:

"However, packaging tools that build binary distributions by running
setup.py install on the command line or as a subprocess will require
modification to work with setuptools. They should use the
--single-version-externally-managed option to the install command,
combined with the standard --root or --record options. See the install
command documentation below for more details."

http://peak.telecommunity.com/DevCenter/setuptools#what-your-users-should-know
http://peak.telecommunity.com/DevCenter/setuptools#install-command

I'm all in favour of a setuptools class, but I think it should follow
what the documentation says and use --s-v-e-m.   My recent python-mako
patch to oe-devel uses these options to do a "old-school" install
which doesn't mean dealing with .pth files, as we're a perfectly good
package management system already.

Ross


