Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Swxzu-0004en-Du
	for openembedded-core@openembedded.org; Thu, 02 Aug 2012 18:11:38 +0200
Received: by lbol5 with SMTP id l5so951216lbo.6
	for <openembedded-core@openembedded.org>;
	Thu, 02 Aug 2012 08:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=tSJHMwTpb/VGTpxSNyVYdflikHkoJk6drpXo/hs3RSM=;
	b=I7btadrcj93Td3/kBvrmlZjcuQTUNAhsvTrpZeAnqFHW8IX25hrGAA1W/ZRHGzAtBn
	Gt3ExOiK+W8gI31eGZG1KOy2pSBp0Swyppos+BNARb5BwEnHCm14g3eEEhyxMM3o5+op
	5NPCbNw4uhhrS4sooFFfgUeTWsVFS4jOd4VKv+s0QXLZ8Wvr1LV2uDX+sueivlUobD++
	ukdxMSoSRdXbMskU2hbdjO3029yMlkZqrUYjhOMZFhCoQQsTF6Nsh6cdi2vHlKv6R+ul
	mIHBVP2OOvIR7crxIcBCSovdhOGbAJuLs8vSv7kXsewICU2xzcXkX2Kx5PCCD0074gJi
	ytJA==
Received: by 10.152.112.138 with SMTP id iq10mr22133996lab.13.1343923198692;
	Thu, 02 Aug 2012 08:59:58 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.114.64.209 with HTTP; Thu, 2 Aug 2012 08:59:38 -0700 (PDT)
In-Reply-To: <1343922792.9756.81.camel@ted>
References: <1343250562.29991.0.camel@ted>
	<20120802135335.GQ16306@jama.jama.net>
	<20120802141450.GS16306@jama.jama.net> <1343922792.9756.81.camel@ted>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 2 Aug 2012 08:59:38 -0700
X-Google-Sender-Auth: zZbXZN4u54ZjgPOQ4ta29sN_We8
Message-ID: <CABcZANmUVia_qXt7a3oG5ofJeJYVO29gOoLaLb7zT=64W00CxQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-core <openembedded-core@openembedded.org>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [PATCH] sstate: Add a two character subdirectory to the sstate directory layout
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 02 Aug 2012 16:11:38 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 2, 2012 at 8:53 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2012-08-02 at 16:14 +0200, Martin Jansa wrote:
>> On Thu, Aug 02, 2012 at 03:53:35PM +0200, Martin Jansa wrote:
>> > On Wed, Jul 25, 2012 at 10:09:22PM +0100, Richard Purdie wrote:
>> > > Currently all sstate files are placed into one directory. This does not scale and
>> > > causes a variety of filesystem issues. This patch adds a two character subdirectory
>> > > to the layout (based on the first two characters of the hash) so that files
>> > > can be split into several directories.
>> > >
>> > > This should help performance of sstate in most cases by avoding creating directories with
>> > > huge numbers of files.
>> > >
>> > > The SSTATE_MIRRORS syntax needs updating to account for the extra path element by
>> > > the addition of a PATH item, for example:
>> > >
>> > > SSTATE_MIRRORS = "file://.* file:///some/path/to/sstate-cache/PATH"
>> > > SSTATE_MIRRORS = "file://.* http://192.168.1.23/sstate-cache/PATH"
>> > >
>> > > This change also sets the scene for using things like lsb-release in
>> > > the
>> >
>> > Is it possible to create 2nd level cache with this?
>> >
>> > I have some server with slow upload but fully populated sstate-cache.
>> >
>> > So on server with faster upload which could be used as offical
>> > SSTATE_MIRROR for SHR distro I would like to add
>> >
>> > SSTATE_MIRRORS ?= "file://.* http://slow-server/sstate-cache/PATH"
>> >
>> > And then sync my sstate-cache directory to public accessible web root (with rsync).
>> >
>> > Problem is that now sstate-cache has all files in slightly different
>> > layout then original sstate-cache on slow server. From what I see I guess
>> > it finds URL with correct prefix "sstate-cache/Gentoo-2.1/0d" and downloads it
>> > directly to sstate-cache dir (and adds .done)
>> >
>> > OE @ ~/oe-core $ ll sstate-cache/sstate-apr-native-x86_64-linux-1.4.6-r1-x86_64-2-*populate-lic*
>> > -rw-r--r-- 1 bitbake bitbake 9257 Jul 30 12:31 sstate-cache/sstate-apr-native-x86_64-linux-1.4.6-r1-x86_64-2-0d2ed24b90d50bf83e5fe94536596e50_populate-lic.tgz
>> > -rw-r--r-- 1 bitbake bitbake    0 Aug  2 15:40 sstate-cache/sstate-apr-native-x86_64-linux-1.4.6-r1-x86_64-2-0d2ed24b90d50bf83e5fe94536596e50_populate-lic.tgz.done
>> >
>> > And then creates symlink in right prefix back to absolute path of sstate-cache/file:
>> > OE @ ~/oe-core $ ll sstate-cache/Gentoo-2.1/0d/sstate-apr-native-x86_64-linux-1.4.6-r1-x86_64-2-*populate-lic*
>> > lrwxrwxrwx 1 bitbake bitbake 123 Aug  2 15:40 sstate-cache/Gentoo-2.1/0d/sstate-apr-native-x86_64-linux-1.4.6-r1-x86_64-2-0d2ed24b90d50bf83e5fe94536596e50_populate-lic.tgz ->
>> > /OE/oe-core/sstate-cache/sstate-apr-native-x86_64-linux-1.4.6-r1-x86_64-2-0d2ed24b90d50bf83e5fe94536596e50_populate-lic.tgz
>> >
>> > But after sstate-cache directory is rsynced somewhere else and oe-core/sstate-cache is removed,
>> > all those symlinks point nowhere and public sstate-cache is unusable.
>> >
>> > Can we have relative paths used in symlinks or even instruct fetcher to download that
>> > file directly to right prefix?
>>
>> 2 more ideas:
>>
>> 1) would be great to also download file.sigdata if it exists, to be able
>>    to compare them when they change even on machine which downloaded
>>    older sstate file from remote url
>> 2) if the reason for this patch was number of files in shared
>>    sstate-cache directory, then fetcher creating .done files makes
>>    number double too (would be fine if fetcher stores all 3 files
>>    (.tgz, .tgz.sigdata, .tgz.done) in right prefix, or moves them to
>>    right prefix instead of symlinks.
>
> I'm aware of the problem. The main issue is that we probably need to
> start enforcing complete paths for all downloads in DL_DIR, including
> http:// urls. This would resolve conflicts like:
>
> SRC_URI = "http://server1.org/somefile.patch \
>            http://server2.org/somefile.patch"
>
> where the two files are different. The trouble is it will pretty much
> break all the source mirrors :(.

I think we need to stop the tendency to use DL_DIR as is as a mirror,
and instead create a task or something to populate a mirror directory
from the DL_DIR. This would avoid potential issues with licensing if
it uses license filtering to control what gets populated, as well.
-- 
Christopher Larson


