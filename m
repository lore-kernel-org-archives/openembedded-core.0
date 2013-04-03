Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UNO2z-0005wF-HZ for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 15:48:17 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r33DfV0v011528; Wed, 3 Apr 2013 14:41:31 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id wbQjQi860S2G; Wed,  3 Apr 2013 14:41:31 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r33DfOl8011515
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Wed, 3 Apr 2013 14:41:27 +0100
Message-ID: <1364995845.6526.20.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Andrei Dinu <andrei.adrianx.dinu@intel.com>
Date: Wed, 03 Apr 2013 14:30:45 +0100
In-Reply-To: <1364990305-20807-1-git-send-email-andrei.adrianx.dinu@intel.com>
References: <1364990305-20807-1-git-send-email-andrei.adrianx.dinu@intel.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Add file information to package information window
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
X-List-Received-Date: Wed, 03 Apr 2013 13:48:17 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2013-04-03 at 14:58 +0300, Andrei Dinu wrote:
> Removed the package files parsing routine from the
> packageinfo.bbclass file and added it to the
> package.bbclass file.
> 
> Signed-off-by: Andrei Dinu <andrei.adrianx.dinu@intel.com>
> ---
>  meta/classes/package.bbclass     |   14 ++++++++++++++
>  meta/classes/packageinfo.bbclass |   20 --------------------
>  2 files changed, 14 insertions(+), 20 deletions(-)
> 
> diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
> index 3479947..121a1dd 100644
> --- a/meta/classes/package.bbclass
> +++ b/meta/classes/package.bbclass
> @@ -1130,6 +1130,17 @@ python emit_pkgdata() {
>      workdir = d.getVar('WORKDIR', True)
>  
>      for pkg in packages.split():
> +        pkgdest = d.getVar('PKGDEST', True)
> +        files_path = pkgdest + '/' + pkg
> +        if os.path.exists(files_path):
> +                items = {}
> +                for path, dirs, files in os.walk(files_path):
> +                        files_list = []
> +                        if os.listdir(path) != []:
> +                            for f in files:
> +                                files_list.append(f)
> +                        if len(files_list) != 0:
> +                            items[path] = files_list           
>          subdata_file = pkgdatadir + "/runtime/%s" % pkg

You're now doing this in a "fastpath" so we need to look carefully at
performance here. Can you have a look at the pkgfiles[pkg] variable and
see if you can get the data you need from that? You should be able to
iterate it and just strip out the prefixes?

Cheers,

Richard




