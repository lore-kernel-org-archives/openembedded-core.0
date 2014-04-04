Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 92AB26E413
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Apr 2014 07:33:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s347XAjf015515
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 4 Apr 2014 00:33:10 -0700 (PDT)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Fri, 4 Apr 2014 00:33:09 -0700
Message-ID: <533E6034.4060906@windriver.com>
Date: Fri, 4 Apr 2014 15:33:08 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>, <openembedded-core@lists.openembedded.org>
References: <cover.1396519133.git.liezhi.yang@windriver.com>
	<a3a8a29aaf2c8349e71f20cd42e3a1627dd27a6c.1396519133.git.liezhi.yang@windriver.com>
	<533DC7B3.3060108@linux.intel.com>
In-Reply-To: <533DC7B3.3060108@linux.intel.com>
Subject: Re: [PATCH 1/1] useradd_base.bbclass: sleep more and more seconds (up to 10)
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
X-List-Received-Date: Fri, 04 Apr 2014 07:33:17 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 04/04/2014 04:42 AM, Saul Wold wrote:
> On 04/03/2014 02:59 AM, Robert Yang wrote:
>>
>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>> ---
>>   meta/classes/useradd_base.bbclass | 14 +++++++-------
>>   1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta/classes/useradd_base.bbclass
>> b/meta/classes/useradd_base.bbclass
>> index 7aafe29..01d2e99 100644
>> --- a/meta/classes/useradd_base.bbclass
>> +++ b/meta/classes/useradd_base.bbclass
>> @@ -24,7 +24,7 @@ perform_groupadd () {
>>               group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
>>               if test "x$group_exists" = "x"; then
>>                   bbwarn "groupadd command did not succeed. Retrying..."
>> -                sleep 1
>> +                sleep `expr $count + 1`
>
> Why not move the count assignment that is below the fi (not visible in this
> diff) to above the test and then check for count > retries, this will save one
> call to expr.
>

Ah, yes, thanks, we can move the sleep after the bbfatal so that we don't
need the extra "expr" or check count > retries.

Updated:

   git://git.openembedded.org/openembedded-core-contrib rbt/sleep
   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/sleep


diff --git a/meta/classes/useradd_base.bbclass b/meta/classes/useradd_base.bbclass
index 7aafe29..c47b1eb 100644
--- a/meta/classes/useradd_base.bbclass
+++ b/meta/classes/useradd_base.bbclass
@@ -24,7 +24,6 @@ perform_groupadd () {
  			group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
  			if test "x$group_exists" = "x"; then
  				bbwarn "groupadd command did not succeed. Retrying..."
-				sleep 1
  			else
  				break
  			fi
@@ -32,6 +31,7 @@ perform_groupadd () {
  			if test $count = $retries; then
  				bbfatal "Tried running groupadd command $retries times without scucess, 
giving up"
  			fi
+                        sleep $count
  		done
  	else
  		bbwarn "group $groupname already exists, not re-creating it"
@@ -52,7 +52,6 @@ perform_useradd () {
  		       user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
  		       if test "x$user_exists" = "x"; then
  			       bbwarn "useradd command did not succeed. Retrying..."
-			       sleep 1
  		       else
  			       break
  		       fi
@@ -60,6 +59,7 @@ perform_useradd () {
  		       if test $count = $retries; then
  				bbfatal "Tried running useradd command $retries times without scucess, 
giving up"
  		       fi
+		       sleep $count
  	       done
  	else
  		bbwarn "user $username already exists, not re-creating it"
@@ -90,7 +90,6 @@ perform_groupmems () {
  			mem_exists="`grep "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" 
$rootdir/etc/group || true`"
  			if test "x$mem_exists" = "x"; then
  				bbwarn "groupmems command did not succeed. Retrying..."
-				sleep 1
  			else
  				break
  			fi
@@ -102,6 +101,7 @@ perform_groupmems () {
  				fi
  				bbfatal "Tried running groupmems command $retries times without scucess, 
giving up"
  			fi
+			sleep $count
  		done
  	else
  		bbwarn "group $groupname already contains $username, not re-adding it"
@@ -126,7 +126,6 @@ perform_groupdel () {
  			group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
  			if test "x$group_exists" != "x"; then
  				bbwarn "groupdel command did not succeed. Retrying..."
-				sleep 1
  			else
  				break
  			fi
@@ -134,6 +133,7 @@ perform_groupdel () {
  			if test $count = $retries; then
  				bbfatal "Tried running groupdel command $retries times without scucess, 
giving up"
  			fi
+			sleep $count
  		done
  	else
  		bbwarn "group $groupname doesn't exist, not removing it"
@@ -154,7 +154,6 @@ perform_userdel () {
  		       user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
  		       if test "x$user_exists" != "x"; then
  			       bbwarn "userdel command did not succeed. Retrying..."
-			       sleep 1
  		       else
  			       break
  		       fi
@@ -162,6 +161,7 @@ perform_userdel () {
  		       if test $count = $retries; then
  				bbfatal "Tried running userdel command $retries times without scucess, 
giving up"
  		       fi
+		       sleep $count
  	       done
  	else
  		bbwarn "user $username doesn't exist, not removing it"
@@ -184,7 +184,6 @@ perform_groupmod () {
  			eval $PSEUDO groupmod $opts
  			if test $? != 0; then
  				bbwarn "groupmod command did not succeed. Retrying..."
-				sleep 1
  			else
  				break
  			fi
@@ -192,6 +191,7 @@ perform_groupmod () {
  			if test $count = $retries; then
  				bbfatal "Tried running groupmod command $retries times without scucess, 
giving up"
  			fi
+			sleep $count
  		done
  	else
  		bbwarn "group $groupname doesn't exist, unable to modify it"
@@ -214,7 +214,6 @@ perform_usermod () {
  		       eval $PSEUDO usermod $opts
  		       if test $? != 0; then
  			       bbwarn "usermod command did not succeed. Retrying..."
-			       sleep 1
  		       else
  			       break
  		       fi
@@ -222,6 +221,7 @@ perform_usermod () {
  		       if test $count = $retries; then
  				bbfatal "Tried running usermod command $retries times without scucess, 
giving up"
  		       fi
+		       sleep $count
  	       done
  	else
  		bbwarn "user $username doesn't exist, unable to modify it"

// Robert

> Sau!
>
>>               else
>>                   break
>>               fi
>> @@ -52,7 +52,7 @@ perform_useradd () {
>>                  user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
>>                  if test "x$user_exists" = "x"; then
>>                      bbwarn "useradd command did not succeed. Retrying..."
>> -                   sleep 1
>> +                   sleep `expr $count + 1`
>>                  else
>>                      break
>>                  fi
>> @@ -90,7 +90,7 @@ perform_groupmems () {
>>               mem_exists="`grep
>> "^$groupname:[^:]*:[^:]*:\([^,]*,\)*$username\(,[^,]*\)*" $rootdir/etc/group
>> || true`"
>>               if test "x$mem_exists" = "x"; then
>>                   bbwarn "groupmems command did not succeed. Retrying..."
>> -                sleep 1
>> +                sleep `expr $count + 1`
>>               else
>>                   break
>>               fi
>> @@ -126,7 +126,7 @@ perform_groupdel () {
>>               group_exists="`grep "^$groupname:" $rootdir/etc/group || true`"
>>               if test "x$group_exists" != "x"; then
>>                   bbwarn "groupdel command did not succeed. Retrying..."
>> -                sleep 1
>> +                sleep `expr $count + 1`
>>               else
>>                   break
>>               fi
>> @@ -154,7 +154,7 @@ perform_userdel () {
>>                  user_exists="`grep "^$username:" $rootdir/etc/passwd || true`"
>>                  if test "x$user_exists" != "x"; then
>>                      bbwarn "userdel command did not succeed. Retrying..."
>> -                   sleep 1
>> +                   sleep `expr $count + 1`
>>                  else
>>                      break
>>                  fi
>> @@ -184,7 +184,7 @@ perform_groupmod () {
>>               eval $PSEUDO groupmod $opts
>>               if test $? != 0; then
>>                   bbwarn "groupmod command did not succeed. Retrying..."
>> -                sleep 1
>> +                sleep `expr $count + 1`
>>               else
>>                   break
>>               fi
>> @@ -214,7 +214,7 @@ perform_usermod () {
>>                  eval $PSEUDO usermod $opts
>>                  if test $? != 0; then
>>                      bbwarn "usermod command did not succeed. Retrying..."
>> -                   sleep 1
>> +                   sleep `expr $count + 1`
>>                  else
>>                      break
>>                  fi
>>
>
>

