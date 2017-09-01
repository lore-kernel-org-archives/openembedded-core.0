Return-Path: <jose.alarcon@ge.com>
Received: from mx0a-00176a03.pphosted.com (mx0b-00176a03.pphosted.com
	[67.231.157.48])
	by mail.openembedded.org (Postfix) with ESMTP id BFA957846E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  1 Sep 2017 06:38:51 +0000 (UTC)
Received: from pps.filterd (m0048300.ppops.net [127.0.0.1])
	by m0048300.ppops.net-00176a03. (8.16.0.21/8.16.0.21) with SMTP id
	v816cPiY045554 for <openembedded-core@lists.openembedded.org>;
	Fri, 1 Sep 2017 02:38:52 -0400
To: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20170826112602.15344-1-jose.alarcon@ge.com>
	<20170826112602.15344-2-jose.alarcon@ge.com>
From: Jose Alarcon <jose.alarcon@ge.com>
Message-ID: <32a0defa-94ba-0ec6-86b4-ad9b4eb1162e@ge.com>
Date: Fri, 1 Sep 2017 09:38:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170826112602.15344-2-jose.alarcon@ge.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2017-09-01_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
	priorityscore=1501 malwarescore=0
	suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
	lowpriorityscore=0 impostorscore=0 adultscore=0 classifier=spam
	adjust=0
	reason=mlx scancount=1 engine=8.0.1-1707230000
	definitions=main-1709010097
Subject: Re: [PATCH 2/2] rootfs-postcommands: add test for unsatisfied RRECOMMENDS
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
X-List-Received-Date: Fri, 01 Sep 2017 06:38:52 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 26.08.2017 14:26, Jose Alarcon wrote:
> The do_rootfs log contains a number of unsatisfied package
> recommendations. At the moment those are only visible when
> reviewing the rootfs log.
>
> This patch adds an extra check to surface any unsatisfied
> recommendation  as WARNINGS to the build output when
> "debug-tweaks" is enabled.
>
> Signed-off-by: Jose Alarcon <jose.alarcon@ge.com>

Hello,

Gentle reminder, has anyone have a chance to review this patch?

Thanks,

--
Jose Alarcon

> ---
>  meta/classes/rootfs-postcommands.bbclass | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
> index fb36bad..e7ef382 100644
> --- a/meta/classes/rootfs-postcommands.bbclass
> +++ b/meta/classes/rootfs-postcommands.bbclass
> @@ -50,6 +50,9 @@ python () {
>      d.appendVar('ROOTFS_POSTPROCESS_COMMAND', '${SORT_PASSWD_POSTPROCESS_COMMAND}')
>  }
>  
> +# Enable QA check for unsatisfied recommendations if debug-tweaks is enabled
> +ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains_any("IMAGE_FEATURES", "debug-tweaks", "rootfs_log_check_recommends; ", "",d)}'
> +
>  systemd_create_users () {
>  	for conffile in ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd.conf ${IMAGE_ROOTFS}/usr/lib/sysusers.d/systemd-remote.conf; do
>  		[ -e $conffile ] || continue
> @@ -307,3 +310,15 @@ python write_image_test_data() {
>             os.remove(testdata_link)
>          os.symlink(os.path.basename(testdata), testdata_link)
>  }
> +
> +# Check for unsatisfied recommendations (RRECOMMENDS)
> +python rootfs_log_check_recommends() {
> +    log_path = d.expand("${T}/log.do_rootfs")
> +    with open(log_path, 'r') as log:
> +        for line in log:
> +            if 'log_check' in line:
> +                continue
> +
> +            if 'unsatisfied recommendation for' in line:
> +                bb.warn('[log_check] %s: %s' % (d.getVar('PN', True), line))
> +}


