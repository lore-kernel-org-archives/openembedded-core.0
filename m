Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1TPGmh-0002gl-56
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 19:54:59 +0200
Received: by mail-lb0-f175.google.com with SMTP id y2so463201lbk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Oct 2012 10:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=YTsXo5wcnoE/anbRZ1DV2XzWytr+/cS5wOQG/Ym+xF4=;
	b=srv041V1g+ihlnUpEOfv//fQODF0RiW5eSXWXL0Yxws03OGIpGYBC45BSoXcZu+OL1
	U3KKf9DBMH7xeEp97uzihmKOsnlPTSObvFc+u9canypBAYWgBlYsjwlDgYuq/acP2JvE
	WJkS5yHzX1wx/BP+h/yEK7vav5Z2iMZhl9FuJbRbPi4RH+SdvfJN7b9NhImPYKqFY/sq
	Dg+xR/SPTOdcqGXIpUkGkljI2h8v6tpRyXZoMTGqjt5T9ng0ZcyOWYXr1VGbn+rxi3Sw
	9GP1h4SaWMCGQOEO0HJfwsHV6RjPRmdWVPfrg0bWA+eUI2MQsWNcONS6QoGAT22gA9K9
	B14g==
Received: by 10.152.123.103 with SMTP id lz7mr1766241lab.21.1350668498069;
	Fri, 19 Oct 2012 10:41:38 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.1.49 with HTTP; Fri, 19 Oct 2012 10:41:17 -0700 (PDT)
In-Reply-To: <20121019165738.GC14620@mcrowe.com>
References: <20121019153834.GA13159@mcrowe.com>
	<CABcZANkWq0YZ38E9cCDvoJvpou0eunXJcHUUQCnbhRmDm_oQLg@mail.gmail.com>
	<20121019165738.GC14620@mcrowe.com>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 19 Oct 2012 10:41:17 -0700
X-Google-Sender-Auth: Xd4jNxcwQ8HkZVvP2wiC8GLuojI
Message-ID: <CABcZANkCuggDC-rmqBA=N3GaWqTYWAPr+9eOoECiTSGVVgQN7A@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Using SSTATE_MIRRORS with sstate subdirectories
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
X-List-Received-Date: Fri, 19 Oct 2012 17:54:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 19, 2012 at 9:57 AM, Mike Crowe <mac@mcrowe.com> wrote:
> SSTATE_MIRRORS =3D "\
> file://Debian-testing/.* file:///private/sstate-cache/Debian-6.0.6/PATH \=
n \
> file://.* file:///private/sstate-cache/PATH \n \
> "
>
> Then I get paths like:
>
> DEBUG: For url file://Debian-testing/8c/sstate-tar-replacement-native-x86=
_64-linux-1.26-r3-x86_64-2-8cc4342260b064ace38e0aa1acf2f618_populate-sysroo=
t.tgz returning file:///private/sstate-cache/Debian-6.0.6/Debian-testing/8c=
/sstate-tar-replacement-native-x86_64-linux-1.26-r3-x86_64-2-8cc4342260b064=
ace38e0aa1acf2f618_populate-sysroot.tgz

SSTATE_MIRRORS =3D "\
file://${LSBNATIVESTRING} file:///private/sstate-cache/Debian-6.0.6 \n \
file://.* file:///private/sstate-cache/PATH \n \
"

We do this at mentor with a class to simplify the setup. See
http://git.yoctoproject.org/cgit/cgit.cgi/meta-mentor/tree/classes/sstate-r=
euse.bbclass.
Then you'd do this:

INHERIT +=3D "sstate-reuse"
SSTATE_MIRROR_DISTROS =3D "Debian-testing"
SSTATE_MIRROR_SITES =3D "file:///private/sstate-cache"

We do most of our automated builds on 32 bit and 64 bit centos 5.4
hosts, then those native/cross sstates can then be reused just about
everywhere, since that distro is so old.
--=20
Christopher Larson


