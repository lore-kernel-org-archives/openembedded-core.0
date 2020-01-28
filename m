Return-Path: <mark.hatle@kernel.crashing.org>
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by mail.openembedded.org (Postfix) with ESMTP id B4BEB7FF00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 18:08:47 +0000 (UTC)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 00SI8mAG015848
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NO) for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jan 2020 12:08:48 -0600
To: openembedded-core@lists.openembedded.org
References: <20200122002702.166957-1-mark.hatle@kernel.crashing.org>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
Message-ID: <9bb466af-cfb5-8d00-6d37-dff9f450d763@kernel.crashing.org>
Date: Tue, 28 Jan 2020 12:08:47 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200122002702.166957-1-mark.hatle@kernel.crashing.org>
Subject: Re: [PATCH 1/2] toaster.bbclass: Fix error when toaster is used to monitor a build
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
X-List-Received-Date: Tue, 28 Jan 2020 18:08:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Ping.

On 1/21/20 6:27 PM, Mark Hatle wrote:
> The error being corrected looks like:
> 
> File: '/home/jenkins/workspace/OEBuild/build-32/oe-core/meta/classes/toaster.bbclass', lineno: 130, function: toaster_package_dumpdata
>      0126:    lpkgdata = {}
>      0127:    datadir = os.path.join(pkgdatadir, 'runtime')
>      0128:
>      0129:    # scan and send data for each generated package
>  *** 0130:    for datafile in os.listdir(datadir):
>      0131:        if not datafile.endswith('.packaged'):
>      0132:            lpkgdata = _toaster_load_pkgdatafile(datadir, datafile)
>      0133:            # Fire an event containing the pkg data
>      0134:            bb.event.fire(bb.event.MetadataEvent("SinglePackageInfo", lpkgdata), d)
> Exception: FileNotFoundError: [Errno 2] No such file or directory: '/home/jenkins/workspace/OEBuild/builds/build-32/tmp-glibc/work/core2-64-oe-linux/puzzles/2_0.0+gitAUTOINC+c6e0161dd4-r0/pkgdata/runtime'
> 
> There must be a small window before the data is available, but while the monitoring is on-going.
> 
> Signed-off-by: Mark Hatle <mark.hatle@kernel.crashing.org>
> ---
>  meta/classes/toaster.bbclass | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/meta/classes/toaster.bbclass b/meta/classes/toaster.bbclass
> index 6a65ecb957..9518ddf7a4 100644
> --- a/meta/classes/toaster.bbclass
> +++ b/meta/classes/toaster.bbclass
> @@ -126,11 +126,12 @@ def _toaster_dumpdata(pkgdatadir, d):
>      datadir = os.path.join(pkgdatadir, 'runtime')
>  
>      # scan and send data for each generated package
> -    for datafile in os.listdir(datadir):
> -        if not datafile.endswith('.packaged'):
> -            lpkgdata = _toaster_load_pkgdatafile(datadir, datafile)
> -            # Fire an event containing the pkg data
> -            bb.event.fire(bb.event.MetadataEvent("SinglePackageInfo", lpkgdata), d)
> +    if os.path.exists(datadir):
> +        for datafile in os.listdir(datadir):
> +            if not datafile.endswith('.packaged'):
> +                lpkgdata = _toaster_load_pkgdatafile(datadir, datafile)
> +                # Fire an event containing the pkg data
> +                bb.event.fire(bb.event.MetadataEvent("SinglePackageInfo", lpkgdata), d)
>  
>  python toaster_package_dumpdata() {
>      _toaster_dumpdata(d.getVar('PKGDESTWORK'), d)
> 

