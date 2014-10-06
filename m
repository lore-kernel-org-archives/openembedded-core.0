Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 640D871775
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Oct 2014 14:51:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s96EpbKR016791
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Oct 2014 07:51:37 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.174.1; Mon, 6 Oct 2014 07:51:37 -0700
Message-ID: <5432AC78.9020004@windriver.com>
Date: Mon, 6 Oct 2014 09:51:36 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <1412607012-84068-1-git-send-email-mark.hatle@windriver.com>
In-Reply-To: <1412607012-84068-1-git-send-email-mark.hatle@windriver.com>
Subject: Re: [PATCH V3] linuxdoc-tools-native: Makedoc.sh uses /tmp and fails w/ noexec mount
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
X-List-Received-Date: Mon, 06 Oct 2014 14:51:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

V3 - Only difference to V2 is the summary line of the commit message.  After 
sending it I realized it wasn't in the right OE format.

V2 - Only difference is adding back in the missing DESTDIR=

On 10/6/14, 9:50 AM, Mark Hatle wrote:
> From: Konrad Scherer <Konrad.Scherer@windriver.com>
>
> The Makedoc.sh script uses the following line to set TMPDIR
>
> export TMPDIR=`mktemp -d ${TMPDIR:-/tmp}/ldt.XXXXXXXXXX`;
>
> and then later in the script:
>
> chmod u+x $TMPDIR/linuxdoc
>
> Since TMPDIR is not set the script will default to /tmp and if /tmp
> is set to noexec (which is becoming more common), the chmod call fails.
>
> Signed-off-by: Konrad Scherer <Konrad.Scherer@windriver.com>
> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
> ---
>   meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
> index ed6ab73..a8a90fc 100644
> --- a/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
> +++ b/meta/recipes-devtools/linuxdoc-tools/linuxdoc-tools-native_0.9.69.bb
> @@ -19,3 +19,7 @@ inherit autotools-brokensep native
>   do_configure () {
>   	oe_runconf
>   }
> +
> +do_install() {
> +	oe_runmake 'DESTDIR=${D}' 'TMPDIR=${T}' install
> +}
>


