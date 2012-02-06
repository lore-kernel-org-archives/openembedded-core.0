Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1RuJGg-0000wD-7e
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 08:45:42 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q167beVH017501
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 5 Feb 2012 23:37:40 -0800 (PST)
Received: from [128.224.162.223] (128.224.162.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Sun, 5 Feb 2012 23:37:40 -0800
Message-ID: <4F2F8344.5000509@windriver.com>
Date: Mon, 6 Feb 2012 15:37:40 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Thunderbird/3.1.15
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1328509284.git.xiaofeng.yan@windriver.com>
	<20120206070513.GC3872@jama.jama.net>
In-Reply-To: <20120206070513.GC3872@jama.jama.net>
X-Originating-IP: [128.224.162.223]
Subject: Re: [PATCH 0/2] glib-2.0: Don't check function "qsort_r" in configure.ac
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Feb 2012 07:45:42 -0000
X-Groupsio-MsgNum: 17075
Content-Type: multipart/mixed; boundary="------------010600020109060500010807"

--------------010600020109060500010807
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id q167beVH017501

On 2012=E5=B9=B402=E6=9C=8806=E6=97=A5 15:05, Martin Jansa wrote:
> On Mon, Feb 06, 2012 at 02:41:09PM +0800, Xiaofeng Yan wrote:
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> The function "g_qsort_with_data" has two kinds of realization. One cal=
ls qsort_r
>> from libglib, the other realize itself. the realization method is cont=
rolled by macro "HAVE_QSORT_R".
>> qsort_r from libglib cause sort error. Add no-check-qsort_r.patch for =
fixing this problem.
>> This patch is to fix bug 1959. After this patch is merged into OE-core=
 I will open a new bug to
>> track the reason why qsort_r report normally. For finishing lsb test i=
n YOCTO 1.2 M3 this patch
>> is applied temporarily.
>>
>> Pull URL: git://git.pokylinux.org/poky-contrib.git
>>    Branch: xiaofeng/1959
>>    Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dxia=
ofeng/1959
>>
>> Thanks,
>>      Xiaofeng Yan<xiaofeng.yan@windriver.com>
>> ---
> no-check-qsort_r.patch is the same as remove.test.for.qsort_r.patch fro=
m
> http://git.openembedded.org/openembedded-core/commit/?id=3D74f43e3b269c=
01dba7cd5215a8e825229bd5ecff
>
> which was later removed from glib-2.0-native in
> http://git.openembedded.org/openembedded-core/commit/?id=3D37579d7d74d1=
27c90c1e078d05c5bf4ba0b3f755
>
> and later removed completely in
> http://git.openembedded.org/openembedded-core/commit/?id=3D812342e44e9e=
361a0fa93cfcfe65cf4dd6f2fb57
>
> Are you sure this patch is right fix? And no need to split adding patch
> itself and adding it to SRC_URI to 2 patches.
>
> Cheers,
>
Hi Martin Jansa,
I reviewed the above link, no-check-qsort_r.patch is  the same as=20
remove.test.for.qsort_r.patch really. Please check attachment for the=20
test program from LSB 4.1. I think we need this patch because it is an=20
error really. LSB report the next information:

After sorting array, the 0-th element of array should be 1, but is 2
After sorting array, the 1-th element of array should be 2, but is 1
After sorting array, the 2-th element of array should be 3, but is 5
After sorting array, the 4-th element of array should be 5, but is 3


I can reuse this patch which was removed before if you think this is a=20
bug. Do you any suggestion?

Compile this test program.
$ gcc -g `pkg-config --cflags glib-2.0` gobject_value_arrays.c -o=20
gobject -lgobject-2.0



--------------010600020109060500010807
Content-Type: text/x-csrc; name="gobject_value_arrays.c"
Content-Disposition: attachment; filename="gobject_value_arrays.c"
Content-Transfer-Encoding: 7bit

/////////////////////////////////////////////////////////////////////////////
// Copyright (C) 2010 The Linux Foundation. All rights reserved.
// 
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
// 
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 
// 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301, USA.
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// This file contains tests for the following library: 
// libgobject-2.0, 
// section: "GVALUE_ARRAYS".
// 
// This C file was generated by the T2C system developed in ISPRAS 
// for The Linux Foundation. 
/////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////
// To build a standalone version of the tests, i.e. the one that does not
// depend on TETware Lite test harness, please follow the instructions below.
// (A standalone executable like this can prove useful for debugging.) 
// 
// 1. Make sure the T2C_ROOT and T2C_SUITE_ROOT environment variables are set properly. 
// T2C_ROOT should contain a path to the main directory of T2C Framework.
// For example, the executable of the T2C C code generator is $T2C_ROOT/t2c/bin/t2c.
// T2C_SUITE_ROOT is main test suite directory, the one where the tet execution 
// configuration file (tetexec.cfg) resides as well as tet_code file etc.
// 
// 2. If the standalone version of the tests is to be built with lsbcc or lsbc++,  
// make sure that lsbcc (or lsbc++, respectively) is somewhere in your PATH. 
// You should also add a path to the LSB pkg-config data 
// (usually /opt/lsb/lib/pkgconfig or /opt/lsb/lib64/pkgconfig) to the beginning of 
// the string contained in PKG_CONFIG_PATH environment variable.
// 
// 3. Before building the standalone version of a test, check if the following 
// files and directories exist:
//  $T2C_SUITE_ROOT/gobject-t2c/tests 
//  $T2C_SUITE_ROOT/gobject-t2c/tests/common.mk
//  $T2C_SUITE_ROOT/gobject-t2c/tests/gobject_value_arrays/
//  $T2C_SUITE_ROOT/gobject-t2c/tests/gobject_value_arrays/gobject_value_arrays.c
//  $T2C_SUITE_ROOT/gobject-t2c/tests/gobject_value_arrays/Makefile
// 
// If some of these are missing, just run ./gen_code.sh script from the $T2C_SUITE_ROOT 
// directory. After that all necessary files and directories should exist.
//
// 4. Execute the following commands:
//      cd $T2C_SUITE_ROOT/gobject-t2c/tests/gobject_value_arrays/
//      make clean
//      make debug
// 
// The C-code of the tests is the same both for release and debug (standalone)
// versions.
// main() function for standalone execution is defined in
// "$T2C_ROOT/t2c/debug/src/dbg_main.c" along with some utility stuff.
// The TET API stubs are declared in "$T2C_ROOT/t2c/debug/include/tet_api.h"
//
// Note that all the test purposes of a standalone test are executed 
// in the same process to simplify debugging (some debuggers may not 
// handle fork() calls properly by default). 
//
// WAIT_TIME configuration parameter has no effect on the standalone tests. 
// They will not be interrupted, no matter how long they run. Otherwise they 
// could be stopped in the middle of the debugging process (because their time 
// had expired) which is probably not what you want.
/////////////////////////////////////////////////////////////////////////////

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <unistd.h>
#include <glib-object.h>



const char* test_name_      = "gobject_value_arrays";
const char* suite_subdir_   = "gobject-t2c";

// List of requirement catalogs to be loaded
const char* rcat_names_[] = {
    "gobject_value_arrays",
    NULL
};

const char* rel_href_path_  = 
    "gobject-t2c/tests/gobject_value_arrays/gobject_value_arrays.html#%s%d\">";
char* t2c_href_tpl_ = NULL;
char* t2c_href_full_tpl_ = NULL;


// Name of the env. variable that is used to determine whether the REQ
// implementation should output just IDs (value = 0, default) or hyperlinks
// to the html representation, enclosed in some pseudotags for DTK Manager
// (value != 0).
const char* t2c_gen_hlinks_name = "T2C_GEN_HLINKS";
int gen_hlinks = 0;


char* init_fail_reason_ = NULL;


/*
g_value_array_append            DONE
g_value_array_copy              DONE
g_value_array_free              DONE
g_value_array_get_nth           DONE
g_value_array_insert            DONE
g_value_array_new               DONE
g_value_array_prepend           DONE
g_value_array_remove            DONE
g_value_array_sort              DONE
g_value_array_sort_with_data    DONE
*/


//Global variables, used in get_value function
//They must be declared as global , because  get_value can return pointers to these variables.

gint  gintVar;
guint guintVar;
gint64 gint64Var;
guint64 huint64Var;
gchar  gcharVar;
guchar gucharVar;
glong glongVar;
gulong gulongVar;
guchar gucharVar;
gfloat gfloatVar;
gdouble gdoubleVar;
gboolean gbooleanVar;

char* message;     // set_value function generates this message , and it contains  the unique text for each GType
char* sortMessage; //this message will be generated in cmp or cmp_data interfaces
GType sortType;

//
//This function gets the GType and calls the correct set interface for this type
//For example, it calls g_value_set_int for G_TYPE_INT.
//
void set_value(GType initType,GValue* value, void* vl )
{

    if(initType==G_TYPE_INT)
    {
         g_value_set_int(value,*((gint *)vl));
         message="The function should return %d,but returns %d";
         return;
    }
    else if(initType==G_TYPE_CHAR)
    {
         g_value_set_char(value,*((gchar *)vl));
         message="The function should return %c,but returns %c";
         return;
    }
    else if(initType==G_TYPE_UCHAR)
    {
         g_value_set_uchar(value,*((guchar *)vl));
         message="The  function should return %u,but returns %u";
         return;
    }
    else if(initType==G_TYPE_LONG)
    {
         g_value_set_long(value,*((glong *)vl));
         message="The  function should return %ld,but returns %ld";
         return;
    }
    else if(initType==G_TYPE_ULONG)
    {
         g_value_set_ulong(value,*((gulong *)vl));
         return;
    }
    else if(initType==G_TYPE_INT64)
    {
         g_value_set_int64(value,*((gint64 *)vl));
         return;
    }
    else if(initType==G_TYPE_UINT)
    {
         g_value_set_uint(value,*((guint *)vl));
         message="The function should return %u,but returns %u";
         return;
    }
    else if(initType==G_TYPE_BOOLEAN)
    {
         g_value_set_boolean(value,*((gboolean *)vl));
         return;
    }
    else if(initType==G_TYPE_DOUBLE)
    {
         g_value_set_double(value,*((gdouble *)vl));
         message="The function should return %f,but returns %f";
         return;
    }
    else if(initType==G_TYPE_FLOAT)
    {
         g_value_set_float(value,*((gfloat *)vl));
         message="The function should return %f,but returns %f";
         return;
    }
    return ;

}


void* get_value(GType initType,GValue* value )
{

    if(initType==G_TYPE_INT)
    {
         gintVar=g_value_get_int(value);
         return  (void*)(&gintVar);
    }
    else if(initType==G_TYPE_CHAR)
    {
         gcharVar=g_value_get_char(value);
         return  (void*)(&gcharVar);
    }
    else if(initType==G_TYPE_UCHAR)
    {
         gucharVar=g_value_get_uchar(value);
         return  (void*)(&gucharVar);
    }
    else if(initType==G_TYPE_LONG)
    {
         glongVar=g_value_get_long(value);
         return  (void*)(&glongVar);
    }
    else if(initType==G_TYPE_ULONG)
    {
         gulongVar=g_value_get_ulong(value);
         return  (void*)(&gulongVar);
    }
    else if(initType==G_TYPE_INT64)
    {
         gint64Var=g_value_get_int64(value);
         return  (void*)(&gint64Var);
    }
    else if(initType==G_TYPE_UINT)
    {
         guintVar=g_value_get_uint(value);
         return  (void*)(&gintVar);
    }
    else if(initType==G_TYPE_BOOLEAN)
    {
         gbooleanVar=g_value_get_boolean(value);
         return  (void*)(&gbooleanVar);
    }
    else if(initType==G_TYPE_DOUBLE)
    {
         gdoubleVar=g_value_get_double(value);
         return  (void*)(&gdoubleVar);
    }
    else if(initType==G_TYPE_FLOAT)
    {
         gfloatVar=g_value_get_float(value);
         return  (void*)(&gfloatVar);
    }
    return (void *)NULL;

}

/////////////////////////////////////////////////////////////////////////
//compare function for g_value_array_sort

gint cmp (gconstpointer a, gconstpointer b)
{
    if(sortType==G_TYPE_INT)
    {
        GValue* aValue=(GValue*)a;
        gint a1=g_value_get_int(aValue);

        GValue* bValue=(GValue*)b;
        gint b1=g_value_get_int(bValue);

        sortMessage="After sorting array, the %d-th element of array should be %d, but is %d";

        if (a1 - b1 < 0)
            return -1;
        if (a1 - b1 > 0)
            return 1;
        return 0;
    }

    if(sortType==G_TYPE_CHAR)
    {
        GValue* aValue=(GValue*)a;
        gchar a1=g_value_get_char(aValue);

        GValue* bValue=(GValue*)b;
        gchar b1=g_value_get_char(bValue);

        sortMessage="After sorting array, the %d-th element of array should be %c, but is %c";

        if (a1 - b1 < 0)
            return -1;
        if (a1 - b1 > 0)
            return 1;
        return 0;
    }

    if(sortType==G_TYPE_UCHAR)
    {
        GValue* aValue=(GValue*)a;
        guchar a1=g_value_get_uchar(aValue);

        GValue* bValue=(GValue*)b;
        guchar b1=g_value_get_uchar(bValue);

        sortMessage="After sorting array, the %d-th element of array should be %u, but is %u";

        if (a1 - b1 < 0)
            return -1;
        if (a1 - b1 > 0)
            return 1;
        return 0;
    }

    if(sortType==G_TYPE_DOUBLE)
    {
        GValue* aValue=(GValue*)a;
        gdouble a1=g_value_get_double(aValue);

        GValue* bValue=(GValue*)b;
        gdouble b1=g_value_get_double(bValue);

        sortMessage="After sorting array, the %d-th element of array should be %f, but is %f";

        if (a1 - b1 < 0)
            return -1;
        if (a1 - b1 > 0)
            return 1;
        return 0;
    }
    
    return -1;

}



gint cmp_data (gconstpointer a, gconstpointer b,gpointer userData)
{

    if(sortType==G_TYPE_INT)
    {
        GValue* aValue=(GValue*)a;
        gint a1=g_value_get_int(aValue);

        GValue* bValue=(GValue*)b;
        gint b1=g_value_get_int(bValue);

        GValue* userValue=(GValue*)userData;
        gint user=g_value_get_int(userValue);

        sortMessage="After sorting array, the %d-th element of array should be %d, but is %d";

        if (a1 - b1 < user)
            return -1;
        if (a1 - b1 > user)
            return 1;
        return 0;


    }


    if(sortType==G_TYPE_CHAR)
    {
        GValue* aValue=(GValue*)a;
        gchar a1=g_value_get_char(aValue);

        GValue* bValue=(GValue*)b;
        gchar b1=g_value_get_char(bValue);

        GValue* userValue=(GValue*)userData;
        gchar user=g_value_get_char(userValue);

        sortMessage="After sorting array, the %d-th element of array should be %c, but is %c";

        if (a1 - b1 < user)
            return -1;
        if (a1 - b1 > user)
            return 1;
        return 0;
    }

    if(sortType==G_TYPE_UCHAR)
    {
        GValue* aValue=(GValue*)a;
        guchar a1=g_value_get_uchar(aValue);

        GValue* bValue=(GValue*)b;
        guchar b1=g_value_get_uchar(bValue);

        GValue* userValue=(GValue*)userData;
        guchar user=g_value_get_uchar(userValue);

        sortMessage="After sorting array, the %d-th element of array should be %u, but is %u";

        if (a1 - b1 < user)
            return -1;
        if (a1 - b1 > user)
            return 1;
        return 0;
    }

    if(sortType==G_TYPE_DOUBLE)
    {
        GValue* aValue=(GValue*)a;
        gdouble a1=g_value_get_double(aValue);

        GValue* bValue=(GValue*)b;
        gdouble b1=g_value_get_double(bValue);

        GValue* userValue=(GValue*)userData;
        gdouble user=g_value_get_double(userValue);

        sortMessage="After sorting array, the %d-th element of array should be %f, but is %f";

        if (a1 - b1 < user)
            return -1;
        if (a1 - b1 > user)
            return  1;
        return 0;
    }
    
    return -1;

}





void main ()
{
#define COUNT           6

#define TYPE            G_TYPE_INT
#define BUILT_IN_TYPE   gint
#define DATA_ARRAY      {2,1,5,4,3,6}
#define RESULT_ARRAY    {1,2,3,4,5,6}
#define USER_DATA       1

    int i;
    gboolean check=TRUE;
    gboolean check_count=TRUE;
    sortType=TYPE;

    GValueArray*  array=NULL;
    g_type_init();
    array=g_value_array_new (COUNT);

    BUILT_IN_TYPE  data_array  []=DATA_ARRAY;
    BUILT_IN_TYPE  result_array[]=RESULT_ARRAY;

    GValue a_value[COUNT]={{0,}};

    BUILT_IN_TYPE user=USER_DATA;
    GValue userValue={0};
    g_value_init (&userValue, TYPE);
    set_value(TYPE,&userValue,(void*)(&user));




    for(i=0;i<COUNT;i++)
    {
        g_value_init (&a_value[i], TYPE);
        set_value(TYPE,&a_value[i],(void*)(&data_array[i]));

    }

    for(i=0;i<COUNT;i++)
    {
        array=g_value_array_append(array,&a_value[i]);
    }
    
    if(array->n_values!=COUNT)
    {
        printf("Before sorting the array should contain %d values, but contains %d",COUNT,array->n_values);
    }

    g_value_array_sort_with_data(array,cmp_data,(void*)&userValue);
    
    if(array->n_values!=COUNT)
    {
        printf("After sorting the array should contain %d values, but contains %d",COUNT,array->n_values);
    }
    
    
    /*
     * number of values contained in the array
     */


    for(i=0;i<COUNT;i++)
    {
	
        GValue* retValue=g_value_array_get_nth(array,i);
        void *ret1=get_value(TYPE,retValue);
        BUILT_IN_TYPE ret= *((BUILT_IN_TYPE *)ret1);

        if(ret!=result_array[i])
        {
		printf ("ret is %d ", ret);
		printf ("result_array[%d] is %d ", i, result_array[i]);
		printf("FAILED !!! \n");
        }

    }
    for (i=0; i < sizeof(result_array)/sizeof(result_array[0]); i++)
    {
        printf("%d ", result_array[i]);
    }
}


--------------010600020109060500010807--
