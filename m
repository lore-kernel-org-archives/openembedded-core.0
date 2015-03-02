Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 410187378D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Mar 2015 13:32:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t22DWRAj003539; Mon, 2 Mar 2015 13:32:27 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id NUa1u9CGv20V; Mon,  2 Mar 2015 13:32:27 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	t22DWBSW003531
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 2 Mar 2015 13:32:23 GMT
Message-ID: <1425303131.26813.67.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Peter Gejgus <Peter.Gejgus@kistler.com>
Date: Mon, 02 Mar 2015 13:32:11 +0000
In-Reply-To: <672D6A2F0F2E8A43891580C45CE5D2E6013E3418@kihagwinex02.int.kistler.com>
References: <672D6A2F0F2E8A43891580C45CE5D2E6013E3418@kihagwinex02.int.kistler.com>
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: Bitbake class - how to escape special characters?
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
X-List-Received-Date: Mon, 02 Mar 2015 13:32:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2015-03-02 at 11:49 +0000, Peter Gejgus wrote:
> Hello,
> 
> This is the excerpt of my bitbake class:
> 
> data_migration_common() {
> 	if [ x"$D" = "x" ]; then
> 		if [[ ! ${CURRENT_DATA_VERSION} =~ ^[0-9]?[0-9].[0-9]?[0-9]$ ]]; then
> 			error-exit "Version information was provided in invalid format!"
> 		fi
> 	...
> 	fi
> }
> 
> python populate_packages_append() {
>     data_migration_pkgs = d.getVar('DATA_MIGRATION_PACKAGES', True).split()
> 
>     for pkg in data_migration_pkgs:
>         bb.note("adding data migration postinst scripts to %s" % pkg)
>         postinst = d.getVar('pkg_postinst_%s' % pkg, True) or d.getVar('pkg_postinst', True)
>         if not postinst:
>             postinst = '#!/bin/sh\n'
>         postinst += d.getVar('data_migration_common', True)
>         d.setVar('pkg_postinst_%s' % pkg, postinst)
> }
> 
> This class generates post-install scriptlet for the packages
> inheriting from this bitbake class.
>
> But bitbake is unable to parse the code in the data_migration_common
> function and claiming:
> ERROR: ExpansionError during parsing .../xyz_0.1.0.bb: Failure
> expanding variable data_migration_common: ShellSyntaxError: Invalid
> token "%s"
>
> This problem is because the regular expression in the function
> data_migration_common contains character '$'. Bitbake succeeds when I
> remove character '$' from this regular expression. Is there some way
> to escape this '$' character? Because I need '$' in my regex.

The problem is in the shell parser that bitbake uses (lib/bb/pysh)
doesn't like that syntax. The expression you have above is bash specific
and we tend to support /bin/dash as /bin/sh so the function you have
there isn't portable.

Cheers,

Richard


