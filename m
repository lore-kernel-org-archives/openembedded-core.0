Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 0919275894
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 13:50:11 +0000 (UTC)
Received: from [IPv6:fda8:8b75:6fa6:1000:a43b:eaca:e79a:f903] (192.168.15.34)
	by smtp.enea.com (172.21.1.209) with Microsoft SMTP Server id
	14.3.224.2; Mon, 28 Sep 2015 15:50:05 +0200
Message-ID: <56094576.6070803@enea.com>
Date: Mon, 28 Sep 2015 16:49:42 +0300
From: Tudor Florea <tudor.florea@enea.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Ian Ray <ian.ray@ge.com>, <openembedded-core@lists.openembedded.org>
References: <1442819513-20171-1-git-send-email-ian.ray@ge.com>
	<1442819513-20171-2-git-send-email-ian.ray@ge.com>
In-Reply-To: <1442819513-20171-2-git-send-email-ian.ray@ge.com>
X-Originating-IP: [192.168.15.34]
Subject: Re: [yocto][PATCH 1/1] ptest: user-specified run-ptest script location
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
X-List-Received-Date: Mon, 28 Sep 2015 13:50:12 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

Hi Ian

On 9/21/2015 10:11, Ian Ray wrote:
> Provides a new variable, PTEST_RUN_SCRIPT_PATH, which points to a
> directory where the run-ptest script is located.  This location
> defaults to the work directory but may be overridden within a recipe
> if a package ships its own run-ptest script.
> 
> Signed-off-by: Ian Ray <ian.ray@ge.com>
> ---
>  meta/classes/ptest.bbclass | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/classes/ptest.bbclass b/meta/classes/ptest.bbclass
> index b5f470f..7d9d0cc 100644
> --- a/meta/classes/ptest.bbclass
> +++ b/meta/classes/ptest.bbclass
> @@ -3,6 +3,7 @@ DESCRIPTION_${PN}-ptest ?= "${DESCRIPTION}  \
>  This package contains a test directory ${PTEST_PATH} for package test purposes."
>  
>  PTEST_PATH ?= "${libdir}/${PN}/ptest"
> +PTEST_RUN_SCRIPT_PATH ??= "${WORKDIR}"
>  FILES_${PN}-ptest = "${PTEST_PATH}"
>  SECTION_${PN}-ptest = "devel"
>  ALLOW_EMPTY_${PN}-ptest = "1"
> @@ -37,8 +38,8 @@ do_install_ptest() {
>  }
>  
>  do_install_ptest_base() {
> -    if [ -f ${WORKDIR}/run-ptest ]; then
> -        install -D ${WORKDIR}/run-ptest ${D}${PTEST_PATH}/run-ptest
> +    if [ -f ${PTEST_RUN_SCRIPT_PATH}/run-ptest ]; then
> +        install -D ${PTEST_RUN_SCRIPT_PATH}/run-ptest ${D}${PTEST_PATH}/run-ptest
Is there any benefit in adding this? Do you have an example of package
that contains a run-ptest file that could benefit of this approach?
Usually, run-ptest is not part of the package but rather is a standalone
file referred by the package recipe. It is the responsibility of the
person implementing ptest functionality come up with a run-ptest file
(containing a script to be run on target to implement testing
functionality) hence is his/her responsibility as well to put it in the
right place.

>          if grep -q install-ptest: Makefile; then
>              oe_runmake DESTDIR=${D}${PTEST_PATH} install-ptest
>          fi
> 

