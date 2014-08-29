Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 699877106F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Aug 2014 15:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7TFbRtr008256; Fri, 29 Aug 2014 16:37:27 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id XVWa42z-GTfQ; Fri, 29 Aug 2014 16:37:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	s7TFbLVC008253
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Fri, 29 Aug 2014 16:37:22 +0100
Message-ID: <1409326642.29296.190.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Lucian Musat <georgex.l.musat@intel.com>
Date: Fri, 29 Aug 2014 16:37:22 +0100
In-Reply-To: <1409320266-29059-3-git-send-email-georgex.l.musat@intel.com>
References: <1409320266-29059-1-git-send-email-georgex.l.musat@intel.com>
	<1409320266-29059-3-git-send-email-georgex.l.musat@intel.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
Mime-Version: 1.0
Cc: Stefan Stanacar <stefanx.stanacar@intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] oeqa/runtime: Automatic test for ptest
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
X-List-Received-Date: Fri, 29 Aug 2014 15:37:35 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-08-29 at 16:51 +0300, Lucian Musat wrote:
> For images without ptest the packages are automatically installed alongside ptest-runner. Log results are saved in ./results folder.
> No cleanup is done for packages after the test is finished.
> 
> Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
> Signed-off-by: Lucian Musat <georgex.l.musat@intel.com>
> ---

[...]

> +    def get_ptest_packages(self):
> +        pkgs = set()
> +        image_pkgtype = self.tc.d.getVar('IMAGE_PKGTYPE', True)
> +        pkgarchs = self.tc.d.getVar('PACKAGE_ARCHS', True).replace("-","_").split()
> +        for arch in pkgarchs:
> +            folder = self.repo_server.root_dir+"/"+image_pkgtype+'/'+arch
> +            if (os.path.isdir(folder)):
> +                for fil in os.listdir(folder):
> +                    if ("ptest" in str(fil) and "ptest-runner" not in str(fil)):
> +                        #get all the packages with -ptest in the name and remove ptest from them for future comparisons 
> +                        filez = "".join(str(fil).split("-ptest"))
> +                        rootfilez = ".".join(filez.split(".")[:-2])
> +                        filex = str(fil).split("-ptest")[0]
> +                        #compare with all the packages installed on the board and get a list of potential matches
> +                        if filex in self.packagelist:
> +                            i = 0
> +                            matches = []
> +                            while i<len(self.pkglist):
> +                                if filex in self.pkglist[i]:
> +                                    matches.append(self.pkglist[i])
> +                                i +=1
> +                            for i in matches:
> +                                #sometimes package names differ from corresponding ptest package names (ex. libacl1 != acl-ptest) so we use the Source field from smart info to compare
> +                                (status, result) = self.target.run("smart info "+i,0)
> +                                rootpkg = re.search("(.*Source:.*)", result).group(1).split(":")[1][1:]
> +                                #even source package names mai differ a little so we do a fuzzy string match (ex. libz-1.2.8-r0 -> zlib-1.2.8-r0)
> +                                m = SequenceMatcher(None, rootpkg, rootfilez)
> +                                if (m.ratio > 0.9):
> +                                    filey = "".join(str(fil).split("-ptest")[0])+"-ptest"
> +                                    pkgs.add(filey)
> +        if str(pkgs) == "set([])":
> +            raise AssertionError("Cannot get ptest packages to install!")
> +        pkgs.add("ptest-runner")
> +        return pkgs

At a quick glance, I wondered if it would be possible to use oe-pkg-util
here so we have one code path for finding the list of ptest packages
available? You can see example usage at  lib/oe/package_manager.py, the
install_complementary function.

I did hear a comment that there may be some issues with that function,
if there are we need to figure out what they are and fix them.

I'm pleased to see progress on this btw!

Cheers,

Richard


