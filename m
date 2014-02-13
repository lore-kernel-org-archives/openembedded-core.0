Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 5AD556EA03
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Feb 2014 11:34:24 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s1DBYAEY026056; Thu, 13 Feb 2014 11:34:10 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id J5MrlG2FTNpz; Thu, 13 Feb 2014 11:34:10 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s1DBY4i8026032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Thu, 13 Feb 2014 11:34:05 GMT
Message-ID: <1392291238.14081.10.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: =?ISO-8859-1?Q?Jo=E3o?= Henrique Ferreira de Freitas <joaohf@gmail.com>
Date: Thu, 13 Feb 2014 11:33:58 +0000
In-Reply-To: <1392250819-10123-3-git-send-email-joaohf@gmail.com>
References: <1392250819-10123-1-git-send-email-joaohf@gmail.com>
	<1392250819-10123-3-git-send-email-joaohf@gmail.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: dvhart@linux.intel.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] cml1.bbclass: Add fragmentconfig task to cml1
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
X-List-Received-Date: Thu, 13 Feb 2014 11:34:24 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Wed, 2014-02-12 at 22:20 -0200, João Henrique Ferreira de Freitas
wrote:
> fragmentconfig() is a new task that makes a diff between the
> old and new config files and writes to the fragment.cfg result file.
> menuconfig() always copy the original config file, so the user
> doesn't need to copy it.
> 
> Signed-off-by: João Henrique Ferreira de Freitas <joaohf@gmail.com>
> ---
>  meta/classes/cml1.bbclass | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
> 
> diff --git a/meta/classes/cml1.bbclass b/meta/classes/cml1.bbclass
> index e292ecb..2053361 100644
> --- a/meta/classes/cml1.bbclass
> +++ b/meta/classes/cml1.bbclass
> @@ -16,8 +16,12 @@ HOST_LOADLIBES = "-lncurses"
>  TERMINFO = "${STAGING_DATADIR_NATIVE}/terminfo"
>  
>  python do_menuconfig() {
> +    import os

Don't import os please, this is always present so we don't need to.

> +    import shutil
> +
>      try:
>          mtime = os.path.getmtime(".config")
> +        shutil.copy(".config", ".config.orig")
>      except OSError:
>          mtime = 0
>  
> @@ -38,3 +42,34 @@ do_menuconfig[depends] += "ncurses-native:do_populate_sysroot"
>  do_menuconfig[nostamp] = "1"
>  addtask menuconfig after do_configure
>  
> +python do_fragmentconfig() {
> +    import shutil
> +    import subprocess
> +
> +    workdir = d.getVar('WORKDIR', True)
> +    fragment = workdir + '/fragment.cfg'
> +    configorig = '.config.orig'
> +    config = '.config'
> +
> +    try:
> +        md5newconfig = bb.utils.md5_file(configorig)
> +        md5config = bb.utils.md5_file(config)
> +        isdiff = md5newconfig != md5config
> +    except OSError:
> +        isdiff = 0
> +
> +    if isdiff:
> +        bb.note("Dumping config fragment into: '%s'." % fragment)
> +        bb.note("new '%s' old '%s'" % (md5newconfig,md5config))
> +
> +        statement = 'diff -Nurp ' + configorig + ' ' + config + '| sed -n "s/^\+//p" >' + fragment
> +        subprocess.call(statement, shell=True)
> +
> +        shutil.copy(configorig, config)
> +    else:
> +        if os.path.exists(fragment):
> +            os.unlink(fragment)
> +}
> +
> +do_fragmentconfig[nostamp] = "1"
> +addtask fragmentconfig



