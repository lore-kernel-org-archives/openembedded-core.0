Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4BB366FF73
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 May 2016 09:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4N9YO8v007771; Mon, 23 May 2016 10:35:10 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id hbMi02F6bwNG; Mon, 23 May 2016 10:35:10 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u4N9Z5TS007885
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 23 May 2016 10:35:06 +0100
Message-ID: <1463996105.9570.18.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patrick Ohly <patrick.ohly@intel.com>, Khem Raj <raj.khem@gmail.com>,
	Olev Kartau <olev.kartau@intel.com>
Date: Mon, 23 May 2016 10:35:05 +0100
In-Reply-To: <1463990873.3095.13.camel@intel.com>
References: <cover.1463546289.git.raj.khem@gmail.com>
	<c41bdd4ac5371d7c08318f7c7fc760b44ce59ba9.1463546289.git.raj.khem@gmail.com>
	<CAMKF1sqUdo1X0v1ET1_udjGb8-7pg8sucv5yZ3=PuYacvtGQwA@mail.gmail.com>
	<1463990873.3095.13.camel@intel.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] useradd.bbclass: Strip trailing '; ' in cmd params
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
X-List-Received-Date: Mon, 23 May 2016 09:35:13 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-05-23 at 10:07 +0200, Patrick Ohly wrote:
> On Wed, 2016-05-18 at 12:38 -0700, Khem Raj wrote:
> > This fix was not sufficient and there has to be extra fix done to
> > also
> > consider the case
> > when sysroot is created during image build time. I have updated it
> > in
> > pull request here
> > 
> > http://git.openembedded.org/openembedded-core-contrib/commit/?h=kra
> > j/pu&id=642c6cf0b6a0371de476513162bd0cefa9c438b3
> 
> That now fails for cases where the USERADD_PARAM ends in trailing
> white
> space after the last valid opts. The reason is that the 'if test "x
> $opts" = "x$remaining"; then break; fi' check does not get triggered
> anymore, because $remaining has the trailing white space whereas
> "$opts"
> does not.
> 
> I'm not sure what the best approach is in this case. Perhaps also
> strip
> trailing whitespace from all assignments to $remaining?
> 
> The case were we see this is:
> USERADD_PARAM_iot-rest-api-server="--system --home /var/lib/empty -
> -no-create-home --shell /bin/false --gid restful restful "
> 
> The build then hangs because the useradd preinst loops forever.

I've posted a patch which addresses this issue since its pretty nasty
for people to run into.

Cheers,

Richard

