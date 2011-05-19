Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QN12G-0000qm-1c
	for openembedded-core@lists.openembedded.org;
	Thu, 19 May 2011 13:04:56 +0200
Received: by yxn22 with SMTP id 22so917327yxn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 May 2011 04:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=Wxs4LhP24SrdxIkRlwDCQ+anHCFbatHymbN0V6vaP6E=;
	b=CN4OEe8RyVh4zt4dckjF5k7Yao/+I/PIWcbwpOt4vMIdZGSANHirAkhBXQV34jqq7a
	ndxhLcJu1MrIAawydc/h9xx2F2oFQFtcsi9fOCTGWhVps7EoFaPUqzMUXghP6sP240js
	IWolWPFCeerhRWq8LLLX3p3OiCybfCEE1RVaE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=TK3q2iytzOlCtjney1ECte7GAPF7pFNWz9udNY28/7RmrI33GPJI8y7/rbRlqQ7z6c
	tw+inJcTPAJzeBMe/ZThBuEJWZwdCumIFiFA8DsMo7TMzDCu1UkrROIEZhIx1rvJVTK5
	BSmdlh8VBchWP04ZLL6i6rPXlOJLw3+Lgl/BA=
MIME-Version: 1.0
Received: by 10.91.33.1 with SMTP id l1mr2402216agj.207.1305802919846; Thu, 19
	May 2011 04:01:59 -0700 (PDT)
Received: by 10.91.176.3 with HTTP; Thu, 19 May 2011 04:01:59 -0700 (PDT)
In-Reply-To: <cover.1305800693.git.lianhao.lu@intel.com>
References: <cover.1305800693.git.lianhao.lu@intel.com>
Date: Thu, 19 May 2011 13:01:59 +0200
Message-ID: <BANLkTimrb+YjVGP_eh_i8nDunvye0vApJA@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH 0/5] network based PR service
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
X-List-Received-Date: Thu, 19 May 2011 11:04:56 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/5/19 Lianhao Lu <lianhao.lu@intel.com>

> From: Lianhao Lu <lianhao.lu@intel.com>
>
> This series of 5 patches implemented the network based PR service and
> enabled
> the poky to use it during the task do_package and do_package_write_xxx. By
> using the network based PR service and the basichash for
> BB_SIGNATURE_HANDLER,
> the poky user may not need to bump the PR manually everytime he/she changes
> the recipe. The package will get automatically rebuilt and new revision
> number
> reflecting the change will be included in the package feed.
>
> The first patch "[PATCH 1/5] Added the PR service." implemented the network
> based PR service on the server side. It is a XMLRPC server with the sqlite3
> as the backend database. The users query an automated value from this
> service
> by giving  a tuple of (version, checksum). The returned value will
> be used as a part of the package revision value during the package feed
> creation process. The following algorihtm is used so this PR service could
> give
> multiple build servers new values for the new index tuple and same values
> for
> the same index tuple:
>
> IF the index tuple(version, checksum) is found,  THEN
>    return the value.
> ELSE
>    find the max value in the database with the same version.
>    increment it and save it into the database along with the index tuple.
>    return the incremented value.
>    (Note: If no matching version is found, save and return the value of 0).
> ENDIF
>
> To start the network based PR service daemon, run the following command
> after
> "sourcing" the environment file oe-init-build-env:
>
>  bitbake-prserv --start
>
> See bitbake-prserv --help to see a detailed description of the options.
>
> The remaining 4 patches enable the poky to use the PR service. In order to
> use
> it, the user needs to set 2 varialbes of PRSERV_HOST and PRSERV_PORT (which
> specify the PR service ip address and port, default is "localhost" and
> "8585"
> respectively) in the file conf/local.conf under the building directory.
> Unsetting these 2 variables would disable the poky to use the PR service
> for
> backward compatibility.
>
> The following important new variables are introduced in bitbake.conf:
>
> PRFORMAT: The final value goes into the package revision. Default is
> something
> like PR.PRAUTO, where PRAUTO is the value returned by the PR service.
>
> PRAUTOINX: The version part of the index tuple for the PR service. Default
> is PF.
> The checksum of that tuple is the task checksum of do_package.
>
> Pull URL: git://git.pokylinux.org/poky-contrib.git
>  Branch: llu/PR-service
>  Browse:
> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=llu/PR-service
>
> Thanks,
>    Lianhao Lu <lianhao.lu@intel.com>
> ---
>
>
> Lianhao Lu (5):
>  Added the PR service.
>  conf/bitbake.conf: Added variables for PR service.
>  classes/package(prserv).bbclass: Added PR service support.
>  classes/package_xxx.class: Added PR service support.
>  meta-yocto/local.conf.sample: Added PRSERV_HOST and PRSERV_PORT.
>
>  bitbake/bin/bitbake-prserv        |   53 ++++++++++
>  bitbake/lib/prserv/__init__.py    |   11 ++
>  bitbake/lib/prserv/db.py          |  100 +++++++++++++++++++
>  bitbake/lib/prserv/serv.py        |  198
> +++++++++++++++++++++++++++++++++++++
>  meta-yocto/conf/local.conf.sample |    5 +
>  meta/classes/package.bbclass      |   36 +++++--
>  meta/classes/package_deb.bbclass  |    6 +-
>  meta/classes/package_ipk.bbclass  |    6 +-
>  meta/classes/package_rpm.bbclass  |    4 +-
>  meta/classes/package_tar.bbclass  |    4 +-
>  meta/classes/prserv.bbclass       |   29 ++++++
>  meta/conf/bitbake.conf            |   14 +++-
>  12 files changed, 443 insertions(+), 23 deletions(-)
>  create mode 100755 bitbake/bin/bitbake-prserv
>  create mode 100644 bitbake/lib/prserv/__init__.py
>  create mode 100644 bitbake/lib/prserv/db.py
>  create mode 100644 bitbake/lib/prserv/serv.py
>  create mode 100644 meta/classes/prserv.bbclass
>
>
> What should I do to either disable this for some recipes, or use a
different (private) server?
We do not wish to rely on an external server for proprietary recipes (or for
recipes for which we made a local change in an overlay).
How is this case handled?

Frans

