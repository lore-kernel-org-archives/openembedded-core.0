Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1T8uho-0003zH-Kg
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 17:06:20 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Sep 2012 07:53:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,367,1344236400"; d="scan'208";a="196548931"
Received: from unknown (HELO [10.255.12.252]) ([10.255.12.252])
	by orsmga002.jf.intel.com with ESMTP; 04 Sep 2012 07:53:56 -0700
Message-ID: <50461604.6090500@linux.intel.com>
Date: Tue, 04 Sep 2012 07:53:56 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:14.0) Gecko/20120717 Thunderbird/14.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1346584261.git.Martin.Jansa@gmail.com>
	<78656451c17d66cb405fd5d12248ce311d0bce8e.1346684630.git.Martin.Jansa@gmail.com>
In-Reply-To: <78656451c17d66cb405fd5d12248ce311d0bce8e.1346684630.git.Martin.Jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 5/9] sstate-cache-management.sh: add option to enable debug output
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
X-List-Received-Date: Tue, 04 Sep 2012 15:06:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/03/2012 08:05 AM, Martin Jansa wrote:
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>   scripts/sstate-cache-management.sh | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
>
> diff --git a/scripts/sstate-cache-management.sh b/scripts/sstate-cache-management.sh
> index 491df5f..0cfff77 100755
> --- a/scripts/sstate-cache-management.sh
> +++ b/scripts/sstate-cache-management.sh
> @@ -22,6 +22,7 @@ confirm=
>   fsym=
>   total_deleted=0
>   verbose=
> +debug=0
>
>   usage () {
>     cat << EOF
> @@ -69,6 +70,9 @@ Options:
>     -v, --verbose
>           explain what is being done
>
> +  -d, --debug
> +        show debug info, repeat for more debug info
> +
>   EOF
>   }
>
> @@ -215,13 +219,16 @@ remove_duplicated () {
>             for arch in $ava_archs; do
>                 grep -h "/$fn-$arch-" $list_suffix >>$fn_tmp
>             done
> +          [ $debug -gt 1 ] && echo "Available files for $fn with suffix $suffix:" && cat $fn_tmp
>             # Use the modification time
>             to_del=$(ls -t $(cat $fn_tmp) | sed -n '1!p')
> +          [ $debug -gt 2 ] && echo "Considering to delete: $to_del"
>             # The sstate file which is downloaded from the SSTATE_MIRROR is
>             # put in SSTATE_DIR, and there is a symlink in SSTATE_DIR/??/ to
>             # it, so filter it out from the remove list if it should not be
>             # removed.
>             to_keep=$(ls -t $(cat $fn_tmp) | sed -n '1p')
> +          [ $debug -gt 2 ] && echo "Considering to keep: $to_keep"
>             for k in $to_keep; do
>                 if [ -L "$k" ]; then
>                     # The symlink's destination
> @@ -235,9 +242,11 @@ remove_duplicated () {
>                 fi
>             done
>             rm -f $fn_tmp
> +          [ $debug -gt 2 ] && echo "Decided to delete: $to_del"
>             gen_rmlist $rm_list "$to_del"
>         done
>         [ ! -s "$rm_list" ] || deleted=`cat $rm_list | wc -l`
> +      [ -s "$rm_list" -a $debug -gt 0 ] && cat $rm_list
>         echo "($deleted files will be removed)"
>         let total_deleted=$total_deleted+$deleted
>     done
> @@ -306,6 +315,7 @@ rm_by_stamps (){
>         gen_rmlist $rm_list "$to_del"
>         let total_deleted=(`cat $rm_list | wc -w`)
>         if [ $total_deleted -gt 0 ]; then
> +          [ $debug -gt 0 ] && cat $rm_list
>             read_confirm
>             if [ "$confirm" = "y" -o "$confirm" = "Y" ]; then
>                 echo "Removing sstate cache files ... ($total_deleted files)"
> @@ -374,6 +384,11 @@ while [ -n "$1" ]; do
>         verbose="-v"
>         shift
>           ;;
> +    --debug)
> +      debug=`expr $debug + 1`
> +      echo "Debug level $debug"
> +      shift
> +        ;;
>       --help|-h)
>         usage
>         exit 0
>
Merged into OE-Core

Thanks
	Sau!



