Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id F32C371A8D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 12:25:10 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Sep 2017 05:25:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,440,1500966000"; d="scan'208";a="156126866"
Received: from kanavin-desktop.fi.intel.com (HELO [10.237.68.161])
	([10.237.68.161])
	by fmsmga006.fm.intel.com with ESMTP; 26 Sep 2017 05:25:11 -0700
To: Mikko Ylinen <mikko.ylinen@linux.intel.com>,
	openembedded-core@lists.openembedded.org
References: <20170926120328.14928-1-mikko.ylinen@linux.intel.com>
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Message-ID: <cf7451e5-77c3-36ff-8e3e-dfef487c6b9e@linux.intel.com>
Date: Tue, 26 Sep 2017 15:21:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170926120328.14928-1-mikko.ylinen@linux.intel.com>
Subject: Re: [PATCH] package_manager: rpm: remove update-alternatives correctly
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
X-List-Received-Date: Tue, 26 Sep 2017 12:25:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 09/26/2017 03:03 PM, Mikko Ylinen wrote:
> @@ -614,13 +614,16 @@ class RpmPM(PackageManager):
>               self._invoke_dnf(["remove"] + pkgs)
>           else:
>               cmd = bb.utils.which(os.getenv('PATH'), "rpm")
> -            args = ["-e", "--nodeps", "--root=%s" %self.target_rootfs]
> +            args = ["-e", "-v", "--nodeps", "--root=%s" %self.target_rootfs]
>   
> -            try:
> -                output = subprocess.check_output([cmd] + args + pkgs, stderr=subprocess.STDOUT).decode("utf-8")
> -            except subprocess.CalledProcessError as e:
> -                bb.fatal("Could not invoke rpm. Command "
> -                     "'%s' returned %d:\n%s" % (' '.join([cmd] + args + pkgs), e.returncode, e.output.decode("utf-8")))
> +            for pkg in pkgs:
> +                try:
> +                    bb.note("Running %s" % ' '.join([cmd] + args + [pkg]))
> +                    output = subprocess.check_output([cmd] + args + [pkg], stderr=subprocess.STDOUT).decode("utf-8")
> +                    bb.note(output)
> +                except subprocess.CalledProcessError as e:
> +                    bb.fatal("Could not invoke rpm. Command "
> +                         "'%s' returned %d:\n%s" % (' '.join([cmd] + args + [pkg]), e.returncode, e.output.decode("utf-8")))
>   
>       def upgrade(self):
>           self._prepare_pkg_transaction()
> 

I'm worried this might significantly slow down image creation. How about 
fixing this in rootfs.py: first remove everything except 
update-alternatives, then remove that?


Alex

