Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (dan.rpsys.net [93.97.175.187])
	by mail.openembedded.org (Postfix) with ESMTP id 2B87D6D12B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Nov 2013 10:39:21 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA1AdHk3026968; Fri, 1 Nov 2013 10:39:18 GMT
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 1BpqJdH3D49X; Fri,  1 Nov 2013 10:39:17 +0000 (GMT)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	rA1AdBOK026964
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Fri, 1 Nov 2013 10:39:13 GMT
Message-ID: <1383302346.25877.132.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Fri, 01 Nov 2013 10:39:06 +0000
In-Reply-To: <e4c7045a8072825bcb82bbd7be1432aa95540691.1383326626.git.liezhi.yang@windriver.com>
References: <cover.1383326626.git.liezhi.yang@windriver.com>
	<e4c7045a8072825bcb82bbd7be1432aa95540691.1383326626.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.6.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] sanity.bbclass: move check_path_length(TMPDIR) to check_sanity_everybuild
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
X-List-Received-Date: Fri, 01 Nov 2013 10:39:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2013-11-02 at 01:26 +0800, Robert Yang wrote:
> We may change the TMPDIR in different builds, so that the
> check_path_length(TMPDIR) should be in check_sanity_everybuild().
> 
> [YOCTO #5442]
> 
> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  meta/classes/sanity.bbclass | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

No.

The stamp than controls these checks is in tmpdir. We detect if tmpdir
moves and error. If we change to a new tmpdir, there will be no stamp
and the check reruns. There is no need to do this every build.

Cheers,

Richard

> diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
> index b8e5b02..c4827f4 100644
> --- a/meta/classes/sanity.bbclass
> +++ b/meta/classes/sanity.bbclass
> @@ -569,9 +569,6 @@ def check_sanity_version_change(status, d):
>      if not oes_bb_conf:
>          status.addresult('You are not using the OpenEmbedded version of conf/bitbake.conf. This means your environment is misconfigured, in particular check BBPATH.\n')
>  
> -    # The length of tmpdir can't be longer than 410
> -    status.addresult(check_path_length(tmpdir, "TMPDIR", 410))
> -
>  def check_sanity_everybuild(status, d):
>      # Sanity tests which test the users environment so need to run at each build (or are so cheap
>      # it makes sense to always run them.
> @@ -672,6 +669,9 @@ def check_sanity_everybuild(status, d):
>          with open(checkfile, "w") as f:
>              f.write(tmpdir)
>  
> +    # The length of TMPDIR can't be longer than 410
> +    status.addresult(check_path_length(tmpdir, "TMPDIR", 410))
> +
>  def check_sanity(sanity_data):
>      import subprocess
>  



