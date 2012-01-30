Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <steve@sakoman.com>) id 1RrzSK-0007QO-Gc
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Jan 2012 23:12:08 +0100
Received: by bkaq10 with SMTP id q10so3800062bka.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 14:04:15 -0800 (PST)
Received-SPF: pass (google.com: domain of steve@sakoman.com designates
	10.205.136.19 as permitted sender) client-ip=10.205.136.19; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of steve@sakoman.com
	designates 10.205.136.19 as permitted sender)
	smtp.mail=steve@sakoman.com
Received: from mr.google.com ([10.205.136.19])
	by 10.205.136.19 with SMTP id ii19mr11025672bkc.60.1327961055788
	(num_hops = 1); Mon, 30 Jan 2012 14:04:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.205.136.19 with SMTP id ii19mr9539520bkc.60.1327961055656;
	Mon, 30 Jan 2012 14:04:15 -0800 (PST)
Received: by 10.204.35.135 with HTTP; Mon, 30 Jan 2012 14:04:15 -0800 (PST)
X-Originating-IP: [74.41.60.154]
In-Reply-To: <4F27108D.4090303@linux.intel.com>
References: <1327957970-15159-1-git-send-email-steve@sakoman.com>
	<4F27108D.4090303@linux.intel.com>
Date: Mon, 30 Jan 2012 14:04:15 -0800
Message-ID: <CAOSpxdbfYhrFNA+1Bq-gVernRi9_1xy+A9Ye3YdWmG7rpqBUhg@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v4 0/3] zypper: support signed repositories
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
X-List-Received-Date: Mon, 30 Jan 2012 22:12:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2012 at 1:50 PM, Saul Wold <sgw@linux.intel.com> wrote:
> Steve, I am still reviewing this, and I need to to a build with non-GPLv3=
,
> since you might have added a dependency with zypper on a GPLv3 item, this
> will take me some checking.
>
> You might want to prepare a patch and test with a GPLv2 version of gnupg =
as
> well. =A0This will not hold up this patch if we know the GPLv2 version is
> forth coming.

I'm not sure that a version 1.x of gnupg will give signed repository suppor=
t.

The zypper package seems to explicitly use gpg2, see log below:

root@omap3-multi:~# zypper refresh
Retrieving repository 'sakoman' metadata [done]
Building repository 'sakoman' cache [done]
All repositories have been refreshed.
root@omap3-multi:~# cat /var/log/zypper.log | grep gpg
2011-12-13 15:10:55 <1> omap3-multi(517) [zypp] RpmDb.cc(~RpmDb):245 -
gpgcheck    : 0
2011-12-13 15:10:55 <1> omap3-multi(517) [zypp] RpmDb.cc(~RpmDb):245 -
gpgkey      :
2011-12-13 15:10:55 <1> omap3-multi(517) [zypp++]
ExternalProgram.cc(start_program):229 Executing '/usr/bin/gpg2'
'--no-default-keyring' '--quiet' '--list-public-keys' '--with-colons'
'--with-fingerprint' '--no-tty' '--no-greeting' '--batch'
'--status-fd' '1' '--homedir'
'/var/tmp/zypp.7TLoJg/zypp-trusted-krnRU0ej'
2011-12-13 15:10:55 <1> omap3-multi(517) [zypp++]
ExternalProgram.cc(start_program):229 Executing '/usr/bin/gpg2'
'--no-default-keyring' '--quiet' '--list-public-keys' '--with-colons'
'--with-fingerprint' '--no-tty' '--no-greeting' '--batch'
'--status-fd' '1' '--homedir'
'/var/tmp/zypp.7TLoJg/zypp-trusted-krnRU0ej'
2011-12-13 15:10:55 <1> omap3-multi(517) [zypp++]
ExternalProgram.cc(start_program):229 Executing '/usr/bin/gpg2'
'--no-default-keyring' '--quiet' '--no-tty' '--no-greeting'
'--no-permission-warning' '--status-fd' '1' '--homedir'
'/var/tmp/zypp.7TLoJg/zypp-trusted-krnRU0ej' '--import'
'/var/tmp/zypp.7TLoJg/TmpFile.bRqNPf'
2011-12-13 15:10:57 <1> omap3-multi(517) [zypp++]
ExternalProgram.cc(start_program):229 Executing 'gpg' '-v'
'--no-default-keyring' '--fixed-list-mode' '--with-fingerprint'
'--with-colons' '--homedir' '/var/tmp/TmpDir.HF2Hg5' '--quiet'
'--no-tty' '--no-greeting' '--batch' '--status-fd' '1'
'/var/tmp/TmpFile.njjEOI'
2011-12-13 15:10:57 <1> omap3-multi(517) [zypp++]
ExternalProgram.cc(start_program):229 Executing '/usr/bin/gpg2'
'--no-default-keyring' '--quiet' '--no-tty' '--no-greeting'
'--no-permission-warning' '--status-fd' '1' '--homedir'
'/var/tmp/zypp.7TLoJg/zypp-general-krfSdyHl' '--import'
'/var/tmp/TmpFile.njjEOI'

If I get some time later this week I will experiment with a earlier
version of gnupg, though I suspect we might have to create a somewhat
questionable symlink from gpg2 to gpg.  Note that it actually seems to
use *both* gpg2 and gpg!

Steve


