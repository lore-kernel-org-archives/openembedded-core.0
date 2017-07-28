Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
	by mail.openembedded.org (Postfix) with ESMTP id 44A077857D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 22:59:18 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id t201so136489524wmt.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jul 2017 15:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kuL3oMEOaFKdx2dYu2KjLtW3KAMIXeo/s7V3+DqHm1g=;
	b=IO4goNknizSi3rycWC8NAjJ3bAwJW9+0xe6jNmdJeWn3Q+FTndrahLdf4fqMa5DacO
	43CVMoWyHLAG+micD13eykNjOZ58iehW7E0ELOr5qR9cZMmcMuk/OCjS1f3eZCJ7j9cB
	zCxEytQIMwjyAqIiCRZ7MMMHBBN7aYsXvu+Qbm+uMw1N8b5T53sNfL0oGj5R0X+gvJg1
	FtUoaFhKlwZDlh9uG6aw7VkwIMcSkfVWbB3+jPmyRto8fo7V5ts5a9ArpUrpjqLTh3YT
	Jt3jRG3nDxM/f4JEnsugPJFl59je98Z3iPq87njX6swRXIAX7bfxD/yDPzieiOukY+AU
	2i5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kuL3oMEOaFKdx2dYu2KjLtW3KAMIXeo/s7V3+DqHm1g=;
	b=S7IQnE+dD31E5c014je48kgz9XtxRVZDwMMzpMqXxA9nM3IH1HEuZ6wBDy2KquWbjh
	y9A0DG+MqYn3x8DiO+LgPp0N5gT8gCPhTj4KU9kxFA4wBFSFkIau+9u5gFpN0JQ1sjzr
	rMqoABl28sKpIzRrh3K8EcLCMaCpMbN5az1xDJTVeB49ezRAziv5RmROVY7j1+1B5j/Z
	EGio5VmCRHcMxTskxzMZgVlJBhdvSbt7TJe6rf/MioeegQSOrOU8zDKg4A/6YEH2qhW/
	oMw5mtW36yghNNSGCCLzeD0HyrsNim41svT1mpPzwSv46edordwBnNB7A0IHu6u4gRri
	CVrQ==
X-Gm-Message-State: AIVw113kGe0dOLlu+yIuObezW4jXIC76UausJwRKnDMEQdvbNIMAPnLc
	ILQ949K9B2yHDpZG/qfkKsQTG8mzzA==
X-Received: by 10.28.88.143 with SMTP id m137mr2065371wmb.71.1501282759936;
	Fri, 28 Jul 2017 15:59:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.175.16 with HTTP; Fri, 28 Jul 2017 15:59:19 -0700 (PDT)
In-Reply-To: <1501223526-62997-1-git-send-email-shen.joon.tan@intel.com>
References: <1501223526-62997-1-git-send-email-shen.joon.tan@intel.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Fri, 28 Jul 2017 15:59:19 -0700
Message-ID: <CAJ86T=XVbuUGujVF1=FT5W2XGPN8JPXXD-BdNZMacpHFwE4rZA@mail.gmail.com>
To: Tan Shen Joon <shen.joon.tan@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] distrodata: function to identify new packages on a release
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
X-List-Received-Date: Fri, 28 Jul 2017 22:59:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 27, 2017 at 11:32 PM, Tan Shen Joon <shen.joon.tan@intel.com> wrote:
> Identify new packages based on two distinct branches. This
> script takes 2 parameters; either a commit-ish or a branch
> name
>
> To run : distrocompare.sh <older hash> <newer hash>
> E.g. distrocompare.sh morty 92aa0e7
> E.g. distrocompare.sh morty pyro
>
> output : The script will produce a file ending with
> new_recipe_list.txt preceeded by the branch name from input
> ---
>  scripts/distro/build-recipe-list.py | 117 ++++++++++++++++++++++++++++++++++++
>  scripts/distro/distrocompare.sh     |  83 +++++++++++++++++++++++++
>  2 files changed, 200 insertions(+)
>  create mode 100755 scripts/distro/build-recipe-list.py
>  create mode 100755 scripts/distro/distrocompare.sh
>
> diff --git a/scripts/distro/build-recipe-list.py b/scripts/distro/build-recipe-list.py
> new file mode 100755
> index 0000000..407deba
> --- /dev/null
> +++ b/scripts/distro/build-recipe-list.py
> @@ -0,0 +1,117 @@
> +#!/usr/bin/env python3
> +#
> +# Copyright (c) 2017, Intel Corporation.
> +#
> +# This program is free software; you can redistribute it and/or modify it
> +# under the terms and conditions of the GNU General Public License,
> +# version 2, as published by the Free Software Foundation.
> +#
> +# This program is distributed in the hope it will be useful, but WITHOUT
> +# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> +# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
> +# more details.
> +#
> +
> +import os
> +import shutil
> +import csv
> +import sys
> +import argparse
> +
> +__version__ = "0.1.0"
> +
> +recipenames = []
> +allrecipes = []
> +
> +def gather_recipes(rows):
> +    # store the data into the array
> +    for row in rows:
> +        if row[0] not in recipenames:
> +            recipenames.append(row[0])
> +            allrecipes.append(row)
> +
> +def generate_recipe_list():
> +    # machine list
> +    machine_list = ( "qemuarm64", "qemuarm", "qemumips64", "qemumips", "qemuppc", "qemux86-64", "qemux86" )
> +    # set filename format
> +    fnformat = 'distrodata.%s.csv'
> +
> +    # store all data files in distrodata
> +    datadir = 'distrodata'
> +
> +    # create the directory if it does not exists
> +    if not os.path.exists(datadir):
> +        os.mkdir(datadir)
> +
> +    # doing bitbake distrodata
> +    for machine in machine_list:
> +        os.system('MACHINE='+ machine + ' bitbake world -c distrodata')
> +        shutil.copy('tmp/log/distrodata.csv', 'distrodata/' + fnformat % machine)
> +
> +    for machine in machine_list:
> +        with open('distrodata/' + fnformat % machine) as f:
> +            reader = csv.reader(f)
> +            rows = reader.__iter__()
> +            gather_recipes(rows)
> +
> +    with open('recipe-list.txt', 'w') as f:
> +        for recipe in sorted(recipenames):
> +            f.write("%s\n" % recipe)
> +    print("file : recipe-list.txt is created with %d entries." % len(recipenames))
> +
> +    with open('all-recipe-list.txt', 'w') as f:
> +        for recipe in sorted(allrecipes):
> +            f.write("%s\n" % ','.join([str(data) for data in recipe]))
> +
> +
> +def diff_for_new_recipes(recipe1, recipe2):
> +    prev_recipe_path = recipe1 + '/'
> +    curr_recipe_path = recipe2 + '/'
> +    if not os.path.isfile(prev_recipe_path + 'recipe-list.txt') or not os.path.isfile(curr_recipe_path + 'recipe-list.txt'):
> +        print("recipe files do not exists. please verify that the file exists.")
> +        exit(1)
> +
> +    import csv
> +
> +    prev = []
> +    new = []
> +
> +    with open(prev_recipe_path + 'recipe-list.txt') as f:
> +        prev = f.readlines()
> +
> +    with open(curr_recipe_path + 'recipe-list.txt') as f:
> +        new = f.readlines()
> +
> +    updates = []
> +    for pn in new:
> +        if not pn in prev:
> +            updates.append(pn.rstrip())
> +
> +    allrecipe = []
> +    with open(recipe1 + '_' + recipe2 + '_new_recipe_list.txt','w') as dr:
> +        with open(curr_recipe_path + 'all-recipe-list.txt') as f:
> +            reader = csv.reader(f, delimiter=',')
> +            for row in reader:
> +                if row[0] in updates:
> +                    dr.write("%s,%s,%s" % (row[0], row[3], row[5]))
> +                    if len(row[9:]) > 0:
> +                        dr.write(",%s" % ','.join(row[9:]))
> +                    dr.write("\n")
> +
> +def main(argv):
> +    if argv[0] == "generate_recipe_list":
> +        generate_recipe_list()
> +    elif argv[0] == "compare_recipe":
> +        diff_for_new_recipes(argv[1], argv[2])
> +    else:
> +        print("no such option. choose either 'generate_recipe_list' or 'compare_recipe'")
> +
> +    exit(0)
> +
> +if __name__ == "__main__":
> +    try:
> +        sys.exit(main(sys.argv[1:]))
> +    except Exception as e:
> +        print("Exception :", e)
> +        sys.exit(1)
> +
> diff --git a/scripts/distro/distrocompare.sh b/scripts/distro/distrocompare.sh
> new file mode 100755
> index 0000000..8558d17
> --- /dev/null
> +++ b/scripts/distro/distrocompare.sh
> @@ -0,0 +1,83 @@
> +#!/usr/bin/env bash
> +#
> +# Copyright (c) 2017, Intel Corporation.
> +# All rights reserved.
> +#
> +# This program is free software; you can redistribute it and/or modify
> +# it under the terms of the GNU General Public License as published by
> +# the Free Software Foundation; either version 2 of the License, or
> +# (at your option) any later version.
> +#
> +# This program is distributed in the hope that it will be useful,
> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> +# GNU General Public License for more details.
> +#
> +# You should have received a copy of the GNU General Public License
> +# along with this program; if not, write to the Free Software
> +# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
> +#
> +# distrocompare.sh : provides capability to get a list of new packages
> +#                    based on two distinct branches. This script takes
> +#                    2 parameters; either a commit-ish or a branch name
> +#
> +#                    To run : distrocompare.sh <older hash> <newer hash>
> +#                    E.g. distrocompare.sh morty 92aa0e7
> +#                    E.g. distrocompare.sh morty pyro
> +#
> +
> +previous_version=$1
> +current_version=$2
> +scriptdir="$( realpath $(dirname "${BASH_SOURCE[0]}" ))"
> +currentworkdir=`pwd`
> +
> +if [ -z  "$previous_version" ] || [ -z "$current_version" ]; then
> +       echo "please input 2 variable; \$1 and \$2"
> +       exit 1
> +fi
> +
> +function create_source {
> +    mkdir poky
> +    cd poky
> +    git init
> +    git remote add -f origin git://git.yoctoproject.org/poky.git

Is this patch intended for poky? Or should this be fetching oe-core and bitbake?

> +}
> +
> +create_source
> +
> +#==================================================================
> +
> +function bake_distrodata {
> +    cd $currentworkdir/poky
> +    # change the branch / commit
> +    git checkout $1
> +    # back to main dir
> +    cd $currentworkdir
> +    # source oe-init to generate a new folder
> +    source poky/oe-init-build-env $1
> +
> +    # if file already exists with distrodata, do not append
> +    if ! grep -q "distrodata" "conf/local.conf"; then
> +        # add inherit distrodata to local.conf to enable distrodata feature
> +        echo 'INHERIT += "distrodata"' >> conf/local.conf
> +    fi
> +
> +    $scriptdir/build-recipe-list.py generate_recipe_list
> +
> +}
> +
> +# bake distrodata for the 2 versions
> +bake_distrodata $1
> +bake_distrodata $2
> +
> +#==================================================================
> +
> +cd $currentworkdir
> +
> +# compare the 2 generated recipe-list.txt
> +$scriptdir/build-recipe-list.py compare_recipe $1 $2
> +
> +# cleanup
> +rm -rf poky $1 $2
> +
> +#==================================================================
> --
> 2.7.4
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

